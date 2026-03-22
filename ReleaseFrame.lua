local addonName, addon = ...

-- Get addon namespace
StayDead = StayDead or {}
local SD = StayDead
local L = SD.L

-- Helper function to check if we should be active in current location
local function ShouldBeActiveInCurrentLocation()
    local db = StayDeadDB
    
    -- Check if addon is enabled
    if not db or not db.enabled then
        return false
    end
    
    -- Check instance type
    local inInstance, instanceType = IsInInstance()
    
    if not inInstance then
        -- Open World
        return db.enableOpenWorld
    elseif instanceType == "party" then
        -- Dungeons (5-man instances)
        return db.enableDungeons
    elseif instanceType == "raid" then
        -- Raids
        return db.enableRaids
    elseif instanceType == "scenario" then
        -- Delves are scenarios; check dedicated setting when available
        if C_DelvesUI and C_DelvesUI.HasActiveDelve and C_DelvesUI.HasActiveDelve() then
            return db.enableDelves
        end
        return db.enableDungeons
    elseif instanceType == "pvp" then
        -- Battlegrounds
        return db.enableBattlegrounds
    else
        -- Unknown instance type, default to disabled
        return false
    end
end

-- Event frame
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")

local isActive = false
local deathTime = nil
local modifierPressTime = nil
local releaseUnlocked = false
local hiddenButtons = {}
local safetyTimer = nil
local hooksInstalled = false

-- Helper function to check if the required modifier key is down
local function IsRequiredModifierDown(modifierKey)
    if modifierKey == "CTRL" then
        return IsControlKeyDown()
    elseif modifierKey == "SHIFT" then
        return IsShiftKeyDown()
    elseif modifierKey == "ALT" then
        return IsAltKeyDown()
    else
        return true -- No modifier required
    end
end

local function GetTimerSeconds()
    return SD.TicksToSeconds(StayDeadDB and StayDeadDB.timerTicks)
end

-- Helper function to check if release is allowed
local function IsReleaseAllowed()
    if not deathTime then
        return false
    end
    
    -- Once unlocked, stay unlocked
    if releaseUnlocked then
        return true
    end
    
    local currentTime = GetTime()
    local db = StayDeadDB
    local timerSeconds = GetTimerSeconds()

    -- If modifier key is required
    if db.keyModifier and db.keyModifier ~= "NONE" then
        if IsRequiredModifierDown(db.keyModifier) then
            if timerSeconds == 0 then
                releaseUnlocked = true
                return true
            end

            if not modifierPressTime then
                modifierPressTime = currentTime
                SD.LogDebug("Modifier %s pressed, starting hold timer.", db.keyModifier)
            end
            
            local holdTime = currentTime - modifierPressTime
            
            if holdTime >= timerSeconds then
                releaseUnlocked = true -- Permanently unlock
                return true
            end
        else
            modifierPressTime = nil -- Reset if modifier released
        end
        return false
    end
    
    -- No modifier required, just check timer
    if timerSeconds > 0 then
        local timeSinceDeath = currentTime - deathTime
        if timeSinceDeath >= timerSeconds then
            releaseUnlocked = true -- Permanently unlock
            return true
        end
        return false
    end
    
    -- No requirements, allow immediately
    releaseUnlocked = true
    return true
end

local function RegisterDeathPopupButtons(db, popup)
    hiddenButtons = {}

    for j = 1, 3 do
        local button = popup.GetButton and popup:GetButton(j) or popup["button"..j]
        
        if button then
            local text = button:GetText()
            if text == _G.DEATH_RELEASE or (db.blockSoulstone and text == _G.USE_SOULSTONE) then
                table.insert(hiddenButtons, button)
                button:EnableMouse(false)
                button:SetAlpha(0)
            end
        end
    end
    SD.LogDebug("Hidden %d popup buttons.", #hiddenButtons)
end

local function ResetDeathPopupState()
    SD.LogDebug("Resetting death popup state. Restoring %d buttons.", #hiddenButtons)

    -- Cancel safety timer if still running
    if safetyTimer then
        safetyTimer:Cancel()
        safetyTimer = nil
    end

    deathTime = nil
    modifierPressTime = nil
    releaseUnlocked = false
    isActive = false

    for i = 1, 4 do
        local popup = _G["StaticPopup"..i]
        if popup then
            -- 1. Restore the original text if we stored it
            if popup.StayDead_OriginalText then
                local fontString = popup.Text or _G[popup:GetName().."Text"]
                if fontString then
                    fontString:SetText(popup.StayDead_OriginalText)
                end
                popup.StayDead_OriginalText = nil
            end

            -- 2. Restore the original height if we stored it
            if popup.StayDead_OriginalHeight then
                popup:SetHeight(popup.StayDead_OriginalHeight)
                popup.StayDead_OriginalHeight = nil
            end

            if popup.StayDead_Headline then
                popup.StayDead_Headline:Hide()
                popup.StayDead_Headline:SetText("")
            end
        end
    end

    for _, btn in ipairs(hiddenButtons) do
        btn:SetAlpha(1)
        btn:EnableMouse(true)
    end

    hiddenButtons = {}
end

-- Expose a force-reset for /sd reset, wrapped in xpcall for maximum safety
function SD.ForceReset()
    local ok, err = xpcall(ResetDeathPopupState, function(e)
        return e .. "\n" .. debugstack(2, 8, 0)
    end)
    if not ok then
        SD.LogError("Error during force reset: " .. tostring(err))
        -- Last-resort: try to at least restore button interactivity
        for _, btn in ipairs(hiddenButtons) do
            pcall(function() btn:SetAlpha(1) end)
            pcall(function() btn:EnableMouse(true) end)
        end
        hiddenButtons = {}
        isActive = false
        deathTime = nil
    end
end

local function StartUnlockListener(popup)
    local fontString = popup.Text or _G[popup:GetName().."Text"]
    if not fontString then return end

    if not popup.StayDead_OriginalText then
        popup.StayDead_OriginalText = fontString:GetText()
    end
    if not popup.StayDead_OriginalHeight and popup:GetHeight() ~= 100 then
        popup.StayDead_OriginalHeight = popup:GetHeight()
    end

    if not popup.StayDead_Headline then
        popup.StayDead_Headline = popup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        popup.StayDead_Headline:SetJustifyH("CENTER")
        popup.StayDead_FontPath = select(1, popup.StayDead_Headline:GetFont())
    end

    popup.StayDead_Headline:Show()

    popup:SetScript("OnUpdate", function(self, elapsed)
        local ok, err = xpcall(function()
            if self.which ~= "DEATH" then
                ResetDeathPopupState()
                self:SetScript("OnUpdate", StaticPopup_OnUpdate)
                return
            end

            if not deathTime then return end
            
            local db = StayDeadDB
            local currentTime = GetTime()
            local timerSeconds = GetTimerSeconds()
            local displayReady = IsReleaseAllowed() and releaseUnlocked
            
            if not displayReady then
                if db.keyModifier and db.keyModifier ~= "NONE" then
                    if modifierPressTime then
                        local remaining = timerSeconds - (currentTime - modifierPressTime)

                        self.StayDead_Headline:SetFont(self.StayDead_FontPath, 14)
                        self.StayDead_Headline:SetPoint("TOP", self, "TOP", 0, -25)
                        self.StayDead_Headline:SetText(string.format(L.KEEP_HOLDING, db.keyModifier))
                        fontString:SetText(string.format("\n\n(%.1fs)", math.max(0, remaining)))
                    else
                        self.StayDead_Headline:SetFont(self.StayDead_FontPath, 18)
                        self.StayDead_Headline:SetPoint("TOP", self, "TOP", 0, -20)
                        self.StayDead_Headline:SetText(L.DO_NOT_RELEASE)
                        fontString:SetText(string.format("\n\n" .. L.HOLD_TO_RELEASE, db.keyModifier))
                    end
                else
                    
                    local elapsedDeath = currentTime - deathTime
                    local remaining = timerSeconds - elapsedDeath

                    self.StayDead_Headline:SetFont(self.StayDead_FontPath, 14)
                    self.StayDead_Headline:SetPoint("TOP", self, "TOP", 0, -25)
                    self.StayDead_Headline:SetText(L.WAIT_TO_RELEASE)
                    fontString:SetText(string.format("\n\n" .. L.READY_IN, math.max(0, remaining)))
                end

                -- Only set height if it isn't already set to 100 to avoid flickering
                if self:GetHeight() ~= 100 then
                    self:SetHeight(100)
                end
            else
                SD.LogDebug("Release unlocked, restoring popup.")
                ResetDeathPopupState()
                self:SetScript("OnUpdate", StaticPopup_OnUpdate)
            end
        end, function(e) return e .. "\n" .. debugstack(2, 8, 0) end)

        if not ok then
            SD.LogError("OnUpdate error, restoring popup: " .. tostring(err))
            ResetDeathPopupState()
            self:SetScript("OnUpdate", StaticPopup_OnUpdate)
        end
    end)
end

local function SetupDeathPopup()
    -- Don't interfere with corpse retrieval — only block the initial release
    if UnitIsGhost("player") then
        SD.LogDebug("Player is a ghost (corpse retrieval), skipping.")
        return false
    end

    local shouldBeActive = ShouldBeActiveInCurrentLocation()
    if not shouldBeActive then
        SD.LogDebug("Not active in current location, skipping.")
        ResetDeathPopupState()
        return false
    end

    local db = StayDeadDB

    -- Record death time and reset modifier tracking
    ResetDeathPopupState()
    deathTime = GetTime()
    isActive = true
    SD.LogDebug("Death detected. Timer=%.1fs, Modifier=%s", SD.TicksToSeconds(db.timerTicks), tostring(db.keyModifier))

    -- Find the DEATH static popup and set up blocking + safety timer
    for i = 1, 4 do
        local popup = _G["StaticPopup" .. i]
        if popup and popup:IsShown() and popup.which == "DEATH" then
            C_Timer.After(0, function()
                RegisterDeathPopupButtons(db, popup)
                StartUnlockListener(popup)

                -- Safety timeout: unconditionally restore buttons after N seconds
                -- If an encounter is in progress, defer until it ends (re-check every 5s)
                local timeout = tonumber(db.safetyTimeout) or 30
                if timeout > 0 then
                    if safetyTimer then
                        safetyTimer:Cancel()
                    end
                    local function TrySafetyReset()
                        if not isActive then
                            safetyTimer = nil
                            return
                        end
                        if IsEncounterInProgress() then
                            SD.LogDebug("Safety timeout deferred — encounter in progress.")
                            safetyTimer = C_Timer.NewTimer(5, TrySafetyReset)
                        else
                            SD.LogDebug("Encounter ended. Safety timeout restarting (%ds).", timeout)
                            safetyTimer = C_Timer.NewTimer(timeout, function()
                                if not isActive then
                                    safetyTimer = nil
                                    return
                                end
                                SD.LogWarn("Safety timeout reached (%ds after encounter). Restoring release buttons.", timeout)
                                safetyTimer = nil
                                ResetDeathPopupState()
                            end)
                        end
                    end
                    safetyTimer = C_Timer.NewTimer(timeout, TrySafetyReset)
                    SD.LogDebug("Safety timeout set to %ds.", timeout)
                end
            end)
        end
    end
end

eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        if hooksInstalled then return end
        hooksInstalled = true

        self:RegisterEvent("PLAYER_ALIVE")
        self:RegisterEvent("PLAYER_UNGHOST")

        -- Loop through all potential popup frames in the pool
        for i = 1, 4 do
            local popup = _G["StaticPopup"..i]
            if popup then
                -- Hook the OnHide script to clean up our mess
                popup:HookScript("OnHide", function(self)
                    local anyDeathShown = false
                    for j = 1, 4 do
                        local other = _G["StaticPopup"..j]
                        if other and other:IsShown() and other.which == "DEATH" then
                            anyDeathShown = true
                            break
                        end
                    end

                    if not anyDeathShown then
                        ResetDeathPopupState()
                    end
                end)
            end
        end

        hooksecurefunc("StaticPopup_Show", function(which)
            if which == "DEATH" then
                SetupDeathPopup()
            end
        end)
    elseif event == "PLAYER_ALIVE" or event == "PLAYER_UNGHOST" then
        if isActive and not UnitIsGhost("player") then
            SD.LogDebug("Player resurrected (%s), cleaning up.", event)
            ResetDeathPopupState()
        end
    end
end)
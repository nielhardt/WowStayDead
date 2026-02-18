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
        -- Scenarios
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

local isActive = nil;
local deathTime = nil
local modifierPressTime = nil
local releaseUnlocked = false
local hiddenButtons = {}

local STR_RELEASE_SPIRIT = nil;
local STR_REINCARNATION = nil;
local STR_USE_SOULSTONE = nil;

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

-- Helper function to check if release is allowed
local function IsReleaseAllowed(db)
    if not deathTime then
        return false
    end
    
    -- Once unlocked, stay unlocked
    if releaseUnlocked then
        return true
    end
    
    local currentTime = GetTime()
    
    -- If modifier key is required
    if db.keyModifier and db.keyModifier ~= "NONE" then
        if IsRequiredModifierDown(db.keyModifier) then
            if db.timerSeconds == 0 then
                releaseUnlocked = true
                return true
            end

            if not modifierPressTime then
                modifierPressTime = currentTime
            end
            
            local holdTime = currentTime - modifierPressTime
            local requiredHoldTime = db.timerSeconds and db.timerSeconds > 0 and db.timerSeconds or 1
            
            if holdTime >= requiredHoldTime then
                releaseUnlocked = true -- Permanently unlock
                return true
            end
        else
            modifierPressTime = nil -- Reset if modifier released
        end
        return false
    end
    
    -- No modifier required, just check timer
    if db.timerSeconds and db.timerSeconds > 0 then
        local timeSinceDeath = currentTime - deathTime
        if timeSinceDeath >= db.timerSeconds then
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
end

local function ResetDeathPopupState()
    if not isActive then return end

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

local function StartUnlockListener(db, popup)
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
    end

    popup.StayDead_Headline:Show()

    popup:SetScript("OnUpdate", function(self, elapsed)
        if self.which ~= "DEATH" then
            ResetDeathPopupState()
            self:SetScript("OnUpdate", StaticPopup_OnUpdate)
            return
        end

        if not deathTime then return end
        
        local currentTime = GetTime()
        local displayReady = IsReleaseAllowed(db) and releaseUnlocked
        
        if not displayReady then
            if db.keyModifier and db.keyModifier ~= "NONE" then
                if modifierPressTime then
                    local remaining = (db.timerSeconds or 2) - (currentTime - modifierPressTime)

                    self.StayDead_Headline:SetFont(self.StayDead_Headline:GetFont(), 14)
                    self.StayDead_Headline:SetPoint("TOP", self, "TOP", 0, -25)
                    self.StayDead_Headline:SetText(string.format(L.KEEP_HOLDING, db.keyModifier))
                    fontString:SetText(string.format("\n\n(%.1fs)", math.max(0, remaining)))
                else
                    self.StayDead_Headline:SetFont(self.StayDead_Headline:GetFont(), 18)
                    self.StayDead_Headline:SetPoint("TOP", self, "TOP", 0, -20)
                    self.StayDead_Headline:SetText(L.DO_NOT_RELEASE)
                    fontString:SetText(string.format("\n\n" .. L.HOLD_TO_RELEASE, db.keyModifier))
                end
            else
                
                local elapsedDeath = currentTime - deathTime
                local remaining = (db.timerSeconds or 0) - elapsedDeath

                self.StayDead_Headline:SetFont(self.StayDead_Headline:GetFont(), 14)
                self.StayDead_Headline:SetPoint("TOP", self, "TOP", 0, -25)
                self.StayDead_Headline:SetText(L.WAIT_TO_RELEASE)
                fontString:SetText(string.format("\n\n" .. L.READY_IN, math.max(0, remaining)))
            end

            -- Only set height if it isn't already set to 100 to avoid flickering
            if self:GetHeight() ~= 100 then
                self:SetHeight(100)
            end
        else
            ResetDeathPopupState()
            self:SetScript("OnUpdate", StaticPopup_OnUpdate)
        end
    end)
end

local function SetupDeathPopup(db)
    local shouldBeActive = ShouldBeActiveInCurrentLocation()
    if not shouldBeActive then
        ResetDeathPopupState()
        return false
    end

    -- Record death time and reset modifier tracking
    ResetDeathPopupState()
    deathTime = GetTime()
    isActive = true
    
    -- Find the DEATH static popup
    for i = 1, 4 do
        local popup = _G["StaticPopup" .. i]
        if popup and popup:IsShown() and popup.which == "DEATH" then
            -- We will handle hiding buttons in the update loop to ensure they stay hidden if game tries to re-enable them
            C_Timer.After(0, function()
                RegisterDeathPopupButtons(db, popup)
                StartUnlockListener(db, popup)
            end)
        end
    end
end

eventFrame:SetScript("OnEvent", function(self, event, ...)
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
            local db = StayDeadDB
            SetupDeathPopup(db)
        end
    end)
end)
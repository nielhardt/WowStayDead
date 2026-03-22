-- StayDead: Prevents accidental spirit releases
local addonName, addon = ...

-- Create addon namespace if it doesn't exist
StayDead = StayDead or {}
local SD = StayDead

-- Initialize localization 
-- Start with English as the base
SD.L = CopyTable(STAYDEAD_LOCALES.enUS)

-- Overlay current locale translations
local currentLocale = GetLocale()
if STAYDEAD_LOCALES[currentLocale] then
    for key, translation in pairs(STAYDEAD_LOCALES[currentLocale]) do
        SD.L[key] = translation
    end
end

local L = SD.L

-- Shared tick/seconds conversion helpers (used by Settings.lua and ReleaseFrame.lua)
function SD.NormalizeTicks(value)
    local numericTicks = tonumber(value) or 5
    return math.min(30, math.max(0, math.floor(numericTicks + 0.5)))
end

function SD.SecondsToTicks(seconds)
    local numericSeconds = tonumber(seconds)
    if numericSeconds == nil then
        return 5
    end
    numericSeconds = math.min(3, math.max(0, numericSeconds))
    return math.floor((numericSeconds * 10) + 0.5)
end

function SD.TicksToSeconds(ticks)
    return SD.NormalizeTicks(ticks) / 10
end

-- Default settings
local defaults = {
    enabled = true,
    timerTicks = 5,
    keyModifier = "CTRL", -- "NONE", "CTRL", "SHIFT", or "ALT"
    safetyTimeout = 30,
    debugMode = false,
    -- Block settings
    blockSoulstone = false,
    -- Location settings
    enableOpenWorld = false,
    enableDelves = false,
    enableBattlegrounds = false,
    enableDungeons = true,
    enableRaids = true,
}

-- Initialize saved variables
function SD:InitDB()
    if not StayDeadDB then
        StayDeadDB = {}
    end
    
    -- Apply defaults for missing values
    for key, value in pairs(defaults) do
        if StayDeadDB[key] == nil then
            StayDeadDB[key] = value
        end
    end

    -- Backward-compatible migration: old profiles used timerSeconds.
    local timerTicks = tonumber(StayDeadDB.timerTicks)
    if timerTicks == nil then
        local timerSeconds = tonumber(StayDeadDB.timerSeconds)
        if timerSeconds ~= nil then
            timerTicks = SD.SecondsToTicks(timerSeconds)
        else
            timerTicks = defaults.timerTicks
        end
    end

    timerTicks = SD.NormalizeTicks(timerTicks)
    StayDeadDB.timerTicks = timerTicks

    -- Keep legacy field in sync to avoid breaking downgrades/older code paths.
    StayDeadDB.timerSeconds = timerTicks / 10
end

-- Main frame
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        SD:InitDB()
        SD.debugMode = StayDeadDB.debugMode or false
        SD.LogInfo("Addon loaded.")
        if SD.debugMode then
            SD.LogInfo("Debug mode |cff00ff00active|r (saved from last session).")
        end
        
        -- Initialize settings UI (from Settings.lua)
        if SD.InitSettings then
            SD:InitSettings()
        end
    end
end)

-- Slash commands
SLASH_STAYDEAD1 = "/sd"
SLASH_STAYDEAD2 = "/staydead"
SlashCmdList["STAYDEAD"] = function(msg)
    local cmd = strtrim(msg):lower()

    if cmd == "help" or cmd == "?" then
        SD.LogInfo("Slash commands:")
        print("  |cff00ccff/sd|r - Open settings")
        print("  |cff00ccff/sd debug|r - Toggle debug logging")
        print("  |cff00ccff/sd status|r - Show current settings")
        print("  |cff00ccff/sd reset|r - Force restore release buttons if stuck")
        print("  |cff00ccff/sd help|r - Show this help")
        return
    end

    if cmd == "reset" then
        if SD.ForceReset then
            SD.ForceReset()
            SD.LogInfo("Release buttons restored.")
        else
            SD.LogWarn("Nothing to reset.")
        end
        return
    end

    if cmd == "debug" then
        SD.debugMode = not SD.debugMode
        StayDeadDB.debugMode = SD.debugMode
        if SD.debugMode then
            SD.LogInfo("Debug mode |cff00ff00enabled|r. Use /sd debug to disable.")
        else
            SD.LogInfo("Debug mode |cffff0000disabled|r.")
        end
        return
    end

    if cmd == "status" then
        local db = StayDeadDB
        SD.LogInfo("Current settings:")
        print(string.format("  Enabled: %s", tostring(db.enabled)))
        print(string.format("  Delay: %.1fs (%d ticks)", SD.TicksToSeconds(db.timerTicks), db.timerTicks))
        print(string.format("  Key Modifier: %s", tostring(db.keyModifier)))
        print(string.format("  Safety Timeout: %ds", tonumber(db.safetyTimeout) or 30))
        print(string.format("  Block Soulstone: %s", tostring(db.blockSoulstone)))
        print(string.format("  Locations: Open World=%s, Delves=%s, BGs=%s, Dungeons=%s, Raids=%s",
            tostring(db.enableOpenWorld), tostring(db.enableDelves), tostring(db.enableBattlegrounds),
            tostring(db.enableDungeons), tostring(db.enableRaids)))
        return
    end

    -- Default: open settings
    if SD.settingsCategory then
        Settings.OpenToCategory(SD.settingsCategory:GetID())
    else
        SD.LogError("Settings not initialized yet. Try again in a moment.")
    end
end

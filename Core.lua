-- SimplyDoNotRelease: Prevents accidental spirit releases
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

-- Default settings
local defaults = {
    enabled = true,
    timerSeconds = 1,
    keyModifier = "CTRL", -- "NONE", "CTRL", "SHIFT", or "ALT"
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
end

-- Get setting value
function SD:GetSetting(key)
    return StayDeadDB[key]
end

-- Set setting value
function SD:SetSetting(key, value)
    StayDeadDB[key] = value
end

-- Main frame
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        SD:InitDB()
        print(L.ADDON_LOADED)
        
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
    -- Open settings
    if SD.settingsCategory then
        Settings.OpenToCategory(SD.settingsCategory:GetID())
    else
        print("|cffff0000Stay Dead:|r Settings not initialized yet. Try again in a moment.")
    end
end

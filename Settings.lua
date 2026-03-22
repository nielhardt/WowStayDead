local addonName, addon = ...

-- Get addon namespace
StayDead = StayDead or {}
local SD = StayDead
local L = SD.L

function SD:InitSettings()
    -- Create settings category
    local category = Settings.RegisterVerticalLayoutCategory("Stay Dead")
    SD.settingsCategory = category
    
    -- Get the layout to add headers
    local layout = SettingsPanel:GetLayout(category)
    
    -- Helper function to add section headers
    local function addHeader(name, tooltip)
        local headerData = { name = name, tooltip = tooltip }
        local headerInitializer = Settings.CreateElementInitializer("SettingsListSectionHeaderTemplate", headerData)
        layout:AddInitializer(headerInitializer)
    end
    
    -- General Settings Section
    addHeader(L.SETTINGS_HEADER_GENERAL, L.SETTINGS_HEADER_GENERAL_TOOLTIP)
    
    -- Key Modifier
    local function GetKeyModifierOptions()
        local container = Settings.CreateControlTextContainer()
        container:Add("NONE", L.SETTINGS_KEY_NONE)
        container:Add("CTRL", L.SETTINGS_KEY_CTRL)
        container:Add("SHIFT", L.SETTINGS_KEY_SHIFT)
        container:Add("ALT", L.SETTINGS_KEY_ALT)
        return container:GetData()
    end
    
    local keyModifierSetting = Settings.RegisterAddOnSetting(
        category,
        "SD_KEY_MODIFIER",
        "keyModifier",
        StayDeadDB,
        type(""),
        L.SETTINGS_KEY_MODIFIER,
        "CTRL"
    )
    Settings.CreateDropdown(category, keyModifierSetting, GetKeyModifierOptions, L.SETTINGS_KEY_MODIFIER_TOOLTIP)

    -- Timer Duration (slider operates in integer ticks 0-30, where 10 ticks = 1 second)
    local function GetTimerValue()
        local timerTicks = StayDeadDB.timerTicks
        if timerTicks == nil then
            return SD.SecondsToTicks(StayDeadDB.timerSeconds)
        end

        return SD.NormalizeTicks(timerTicks)
    end
    
    local function SetTimerValue(ticks)
        ticks = SD.NormalizeTicks(ticks)
        StayDeadDB.timerTicks = ticks
        StayDeadDB.timerSeconds = ticks / 10
    end
    
    local timerSetting = Settings.RegisterProxySetting(
        category,
        "SD_TIMER_TICKS",
        type(0),
        L.SETTINGS_TIMER,
        5,
        GetTimerValue,
        SetTimerValue
    )
    
    local options = Settings.CreateSliderOptions(0, 30, 1)
    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(ticks)
        return string.format("%.1f", ticks / 10)
    end)
    Settings.CreateSlider(category, timerSetting, options, L.SETTINGS_TIMER_TOOLTIP)

    -- Safety Timeout
    local safetyTimeoutSetting = Settings.RegisterAddOnSetting(
        category,
        "SD_SAFETY_TIMEOUT",
        "safetyTimeout",
        StayDeadDB,
        type(0),
        L.SETTINGS_SAFETY_TIMEOUT,
        30
    )
    local safetyOptions = Settings.CreateSliderOptions(0, 120, 5)
    safetyOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
    Settings.CreateSlider(category, safetyTimeoutSetting, safetyOptions, L.SETTINGS_SAFETY_TIMEOUT_TOOLTIP)

    -- Block Types Settings Section
    addHeader(L.SETTINGS_HEADER_BLOCK, L.SETTINGS_HEADER_BLOCK_TOOLTIP)

    local blockSoulstone = Settings.RegisterAddOnSetting(
        category,
        "SD_BLOCKSOULSTONE",
        "blockSoulstone",
        StayDeadDB,
        type(false),
        L.SETTINGS_BLOCK_SOULSTONE,
        false
    )
    Settings.CreateCheckbox(category, blockSoulstone, L.SETTINGS_BLOCK_SOULSTONE_TOOLTIP)

    -- Location Settings Section
    addHeader(L.SETTINGS_HEADER_LOCATION, L.SETTINGS_HEADER_LOCATION_TOOLTIP)
    
    -- Enable/Disable addon
    local enabledSetting = Settings.RegisterAddOnSetting(
        category,
        "SD_ENABLED",
        "enabled",
        StayDeadDB,
        type(true),
        L.SETTINGS_ENABLE_ADDON,
        true
    )
    Settings.CreateCheckbox(category, enabledSetting, L.SETTINGS_ENABLE_ADDON_TOOLTIP)
    
    -- Location-specific settings
    local locationSettings = {
        {key = "enableOpenWorld", label = L.SETTINGS_LOCATION_OPEN_WORLD, default = false},
        {key = "enableDelves", label = L.SETTINGS_LOCATION_DELVES, default = false},
        {key = "enableBattlegrounds", label = L.SETTINGS_LOCATION_BATTLEGROUNDS, default = false},
        {key = "enableDungeons", label = L.SETTINGS_LOCATION_DUNGEONS, default = true},
        {key = "enableRaids", label = L.SETTINGS_LOCATION_RAIDS, default = true},
    }
    
    for _, location in ipairs(locationSettings) do
        local setting = Settings.RegisterAddOnSetting(
            category,
            "SD_" .. location.key:upper(),
            location.key,
            StayDeadDB,
            type(true),
            location.label,
            location.default
        )

        local initializer = Settings.CreateCheckbox(category, setting, location.label)

        initializer:AddModifyPredicate(function() 
            return enabledSetting:GetValue() 
        end)
    end

     -- Helper to manually update location checkbox enabled state
    local locationKeys = {}
    for _, location in ipairs(locationSettings) do
        locationKeys[location.key] = true
    end

    local function UpdateLocationCheckboxes()
        if SettingsPanel.Container and SettingsPanel.Container.SettingsList and SettingsPanel.Container.SettingsList.ScrollBox then
            local scrollBox = SettingsPanel.Container.SettingsList.ScrollBox
            if scrollBox.GetFrames then
                local frames = scrollBox:GetFrames()
                for _, frame in ipairs(frames) do
                    if frame.Checkbox and frame.data and frame.data.setting then
                        local variable = frame.data.setting:GetVariable()
                        if variable and locationKeys[variable] then
                            if enabledSetting:GetValue() then
                                frame.Checkbox:Enable()
                            else
                                frame.Checkbox:Disable()
                            end
                        end
                    end
                end
            end
        end
    end

    -- Add callback to refresh settings when enabled changes
    enabledSetting:SetValueChangedCallback(function(setting, value)
        UpdateLocationCheckboxes()
    end)

    -- Slash Commands Section (compact: all commands in a single header row)
    local commands = {
        { cmd = "/sd", desc = L.SETTINGS_CMD_OPEN },
        { cmd = "/sd debug", desc = L.SETTINGS_CMD_DEBUG },
        { cmd = "/sd reset", desc = L.SETTINGS_CMD_RESET },
    }

    local cmdParts = {}
    local tooltipLines = { L.SETTINGS_HEADER_COMMANDS_TOOLTIP, "" }
    for _, entry in ipairs(commands) do
        table.insert(cmdParts, "|cff00ccff" .. entry.cmd .. "|r")
        table.insert(tooltipLines, "|cff00ccff" .. entry.cmd .. "|r  —  " .. entry.desc)
    end

    addHeader(
        L.SETTINGS_HEADER_COMMANDS .. "    " .. table.concat(cmdParts, "  |cff888888·|r  "),
        table.concat(tooltipLines, "\n")
    )

    -- Register category
    Settings.RegisterAddOnCategory(category)
end
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
    addHeader("General Settings", "Configure how the addon prevents spirit releases")
    
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
    
    -- Timer Duration
    local function GetTimerValue()
        return StayDeadDB.timerSeconds or 2
    end
    
    local function SetTimerValue(value)
        StayDeadDB.timerSeconds = value
    end
    
    local timerSetting = Settings.RegisterProxySetting(
        category,
        "SD_TIMER_SECONDS",
        type(0),
        L.SETTINGS_TIMER,
        1,
        GetTimerValue,
        SetTimerValue
    )
    
    local options = Settings.CreateSliderOptions(0, 10, 1)
    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
    Settings.CreateSlider(category, timerSetting, options, L.SETTINGS_TIMER_TOOLTIP)

    -- Block Types Settings Section
    addHeader("Block Settings", "Choose which buttons to block")

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
    addHeader("Location Settings", "Choose where the addon is active")
    
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
    local function UpdateLocationCheckboxes()
        if SettingsPanel.Container and SettingsPanel.Container.SettingsList and SettingsPanel.Container.SettingsList.ScrollBox then
            local scrollBox = SettingsPanel.Container.SettingsList.ScrollBox
            if scrollBox.GetFrames then
                local frames = scrollBox:GetFrames()
                for i, frame in ipairs(frames) do
                    -- Skip the first checkbox (Enable Addon), location checkboxes are frames 8-12
                    if frame.Checkbox and i > 7 then
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

    -- Add callback to refresh settings when enabled changes
    enabledSetting:SetValueChangedCallback(function(setting, value)
        UpdateLocationCheckboxes()
    end)
    
    -- Register category
    Settings.RegisterAddOnCategory(category)
end
local addonName, addon = ...

StayDead = StayDead or {}
local SD = StayDead

SD.debugMode = false  -- runtime cache; overwritten from StayDeadDB in Core.lua

local function FormatMsg(msg, ...)
    if select("#", ...) > 0 then
        msg = string.format(msg, ...)
    end
    return msg
end

function SD.LogInfo(msg, ...)
    print("StayDead: " .. FormatMsg(msg, ...))
end

function SD.LogWarn(msg, ...)
    print("|cffffcc00StayDead: " .. FormatMsg(msg, ...) .. "|r")
end

function SD.LogError(msg, ...)
    print("|cffff0000StayDead: [ERROR] " .. FormatMsg(msg, ...) .. "|r")
end

function SD.LogDebug(msg, ...)
    if not SD.debugMode then return end
    print("|cff888888StayDead: " .. FormatMsg(msg, ...) .. "|r")
end

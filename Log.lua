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

local PREFIX = "|cff66bbffStayDead:|r "

function SD.LogInfo(msg, ...)
    print(PREFIX .. FormatMsg(msg, ...))
end

function SD.LogWarn(msg, ...)
    print(PREFIX .. "|cffffcc00" .. FormatMsg(msg, ...) .. "|r")
end

function SD.LogError(msg, ...)
    print(PREFIX .. "|cffff0000[ERROR] " .. FormatMsg(msg, ...) .. "|r")
end

function SD.LogDebug(msg, ...)
    if not SD.debugMode then return end
    print(PREFIX .. "|cff888888" .. FormatMsg(msg, ...) .. "|r")
end

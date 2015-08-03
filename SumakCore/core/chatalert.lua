---------------------------------------------
--ChatAlert.lua
---------------------------------------------

local FCV, CFG = unpack(select(2, ...))
local addon_version = GetAddOnMetadata("SumakCore", "Version")
local addon_name_color = "|cfffef00f"
local addon_version_color = "|cff82e2eb"
local addon_loaded_color = "|cff00ff00"

--local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo("SumakCore")

local project_link = [=[ Страница проекта - [http://forum.wowcircle.com/showthread.php?t=455070] ]=]
	
FCV.PrintChatCommonInfo = function ()
	print ("Аддон SumakUI специально для WOWCIRLE")
	print ("Текущая версия - ".. addon_version)
	print (project_link)
	print ("Спасибо за использование аддона")
		
end

FCV.ChatAlert = function (string)
	print (string)
end

FCV.PrintAddonInfo = function (addon_name)
	UpdateAddOnMemoryUsage()
	mem_usd = GetAddOnMemoryUsage(addon_name)
	mem = format("%.2f", mem_usd).." kB"
	addon_version = GetAddOnMetadata(addon_name, "Version")
	print (format("%s %s %s", addon_name_color .. addon_name .. "|r", addon_version_color .. "v." .. addon_version .. "|r", addon_loaded_color .. "- загружен|r"));
	print (format("%s %s", addon_name_color .. "Использование памяти:|r", addon_version_color .. (mem or '') .. "|r"));
end

FCV.PrintChatCommonInfo();
FCV.PrintAddonInfo ("SumakCore");
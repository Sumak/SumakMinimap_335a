---------------------------------------------
--ChatAlert.lua
---------------------------------------------

local FCV, CFG = unpack(SumakDB)

local addon_version = GetAddOnMetadata("SumakCore", "Version")
local addon_name_color = "|cfffef00f"
local addon_version_color = "|cff82e2eb"
local addon_loaded_color = "|cff00ff00"

local project_link = [=[ Страница проекта - [http://forum.wowcircle.com/showthread.php?t=455070] ]=]
	
FCV.PrintChatCommonInfo = function ()
	print ("\n")
	print ("-------------------------------------")
	print ("Аддон SumakUI специально для WOWCIRLE")
	print (format ("%q %s", "Текущая версия - ", addon_version_color .. "v." .. addon_version .. "|r"))
	print (project_link)
	print ("Отдельное спасибо за помощь: \nNeko, Fantaziya, Foximys, Сид, Саяра, Tiers, Aliestra, Alt, DreamlØlz")
	print ("Спасибо за использование аддона")
	print ("-------------------------------------")
end

FCV.ChatAlert = function (string)
	str = format ("%s", addon_name_color .. string .. "|r")
	print (str)
end

FCV.PrintAddonInfo = function (addon_name)
	UpdateAddOnMemoryUsage()
	mem_usd = GetAddOnMemoryUsage(addon_name)
	mem = format("%.2f", mem_usd).." kB"
	addon_version = GetAddOnMetadata(addon_name, "Version")
	print (format("%s %s", addon_name_color .. addon_name .. "|r", addon_loaded_color .. "-> загружен|r"));
	print (format("%s %s", addon_name_color .. "Использование памяти:|r", addon_version_color .. (mem or '') .. "|r"));
end

FCV.PrintChatCommonInfo();
FCV.PrintAddonInfo ("SumakCore");

FCV.PrintColoredText = function (text, color)
print (text, color)
	local text_color
	text_color = format ("%s %s", "|" .. color, text .. "|r" );
	return text_color
end
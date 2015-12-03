---------------------------------------------
-- StatsCore.lua
---------------------------------------------
--if IsInGuild() ~= 1 then return end

local FCV, CFG, LOC = unpack(SumakUI)

local stats_font = CFG.media.font
local font_size = 13
local select, format = select, format;
local guild_member_upd
local guild_text = ""

------------------------------------------	
-- Фрейм гильдонлайн
local top_stats_place = FCV.frame ("top_stats_place", UIParent, 1, "BACKGROUND", true, true, true)
top_stats_place : SetPoint("TOPLEFT", UIParent, 0, 0)
top_stats_place : SetPoint("BOTTOMRIGHT", UIParent, "TOPRIGHT", 0, -20)
--top_stats_place : SetPoint ("TOP", 0, 0)

	
------------------------------------------	
-- Текст гильдонлайн
local guild_online_text = FCV.setfontstring (top_stats_place, 1, nil, nil, "CENTER")
	guild_online_text : SetFont (stats_font, font_size)
	guild_online_text : SetPoint ("LEFT", 10, 0)
	guild_online_text : SetText ("|cff00EEFFG: " .. guild_text)

------------------------------------------	
-- Подсчет гильдонлайн
do
	local guild_member_total, guild_member_online = 0, 0;
	--local guild_text = guild_text
	guild_member_upd = function ()
		if IsInGuild() then 
			guild_member_online, guild_member_total = 0, 0;
			guild_member_total = GetNumGuildMembers(true);
			for i = 0, guild_member_total do 
				if select(9, GetGuildRosterInfo(i)) then 
					guild_member_online = guild_member_online + 1 
				end 
				guild_text = format ("%d %s %d", guild_member_online,"/", guild_member_total)
			end
				else
			guild_text = format ("%s", "Нет гильдии")
		end
			print ("Меняем гильдонлайн!!!")
			print ("Guild_text = " .. guild_text)
			print ("guild_member_total = " .. guild_member_total)
			guild_online_text : SetText ("|cff00EEFFG: " .. guild_text)
			
		--return guild_text
	end
end
print ("Строим фрейм!!!")
--local textt = guild_member_upd ()
	
	
	
top_stats_place : SetScript ("OnEvent", guild_member_upd) 	
	
	
--top_stats_place : RegisterEvent ("PLAYER_ENTERING_WORLD")
--top_stats_place : RegisterEvent ("PLAYER_LOGIN")
top_stats_place : RegisterEvent ("GUILD_ROSTER_UPDATE")
top_stats_place : RegisterEvent ("FRIENDLIST_UPDATE")
top_stats_place : RegisterEvent ("UPDATE_EXHAUSTION")
top_stats_place : RegisterEvent ("PLAYER_GUILD_UPDATE")



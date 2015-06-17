---------------------------------------------
-- variable.lua
---------------------------------------------
local FCV, CFG, LOC = unpack(select(2, ...))

CFG.territory_colors = {
	["friendly"] = {0.1, 1.0, 0.1},
	["sanctuary"] = {0.41, 0.8, 0.94},
	["arena"] = {1.0, 0.1, 0.1},
	["hostile"] = {1.0, 0.1, 0.1},
	["combat"] = {1.0, 0.1, 0.1},
	["contested"] = {1.0, 0.7, 0.0},
	["none"] = {0.1, 1.0, 0.1},
}

FCV.dummy = function() return end
FCV.myname = select(1, UnitName("player"))
FCV.myclass = select(2, UnitClass("player"))
FCV.myrace = select(2, UnitRace("player"))
FCV.myfaction = UnitFactionGroup("player")
FCV.client = GetLocale() 
FCV.resolution = GetCVar("gxResolution")
FCV.screenheight = tonumber(string.match(FCV.resolution, "%d+x(%d+)"))
FCV.screenwidth = tonumber(string.match(FCV.resolution, "(%d+)x+%d"))
FCV.version = GetAddOnMetadata("SumakMinimap", "Version")
FCV.versionnumber = tonumber(FCV.version)
FCV.incombat = UnitAffectingCombat("player")
FCV.patch, FCV.buildtext, FCV.releasedate, FCV.toc = GetBuildInfo()
FCV.build = tonumber(FCV.buildtext)
FCV.level = UnitLevel("player")
FCV.myrealm = GetRealmName()

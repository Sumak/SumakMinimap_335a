---------------------------------------------
-- minimap.lua
---------------------------------------------
local FCV, CFG = unpack(select(2, ...))

local minimap_size = 144
local minimap_font = CFG.media.uffont
local font_size = 13
local anchor_point = 'TOPRIGHT' 
local mmp_pos_x = -25
local mmp_pos_y = -40
local Minimap = Minimap

Minimap : SetScale(1)
Minimap : SetPlayerTexture (CFG.media.minimaparrow)
Minimap : SetPlayerTextureHeight(36)
Minimap : SetPlayerTextureWidth(36)
Minimap : SetClampedToScreen(true)

---- Config end
-------------------------------------------------

----add slash commnd 
-------------------------------------------------


SlashCmdList ["RESETMINIMAP"] = function () 
    Minimap : SetUserPlaced (false)
    ReloadUI ()
end


do
    local function GetTipAnchor(frame)
        local x,y = frame:GetCenter()
        if not x or not y then return "TOPLEFT", "BOTTOMLEFT" end
        local hhalf = (x > UIParent:GetWidth() * 2/3) and "RIGHT" or (x < UIParent:GetWidth() / 3) and "LEFT" or ""
        local vhalf = (y > UIParent:GetHeight() / 2) and "TOP" or "BOTTOM"
        return vhalf..hhalf, frame, (vhalf == "TOP" and "BOTTOM" or "TOP")..hhalf
    end

    MiniMapLFGFrame:HookScript("OnEnter", function(self, ...)
        if LFDSearchStatus:IsShown() then
            LFDSearchStatus:ClearAllPoints()
            LFDSearchStatus:SetClampedToScreen(true)
            LFDSearchStatus:SetPoint( GetTipAnchor(self) )
        end
    end )
end  

---- Addon Info
-------------------------------------------------

local function printAddonInfo ()
	mem_usd = GetAddOnMemoryUsage("SumakMinimap")
	mem = format("%.2f", mem_usd).." kB"
	print('|cfffef00fSumakMinimap |cff82e2eb' .. (FCV.addon_version or '')) 
	print('|cfffef00fMemory used: |cff82e2eb' .. (mem or '')) 
end

-------------------------------------------------
---- minimap location
Minimap : ClearAllPoints()
Minimap : SetPoint (anchor_point, UIParent, mmp_pos_x, mmp_pos_y)

-------------------------------------------------
---- The frame for minimap
local minimapframe = FCV.frame ("minimapframe", Minimap, 1, "BACKGROUND", true, true, true)
	minimapframe : SetPoint ("TOPLEFT", -4, 4)
	minimapframe : SetPoint ("BOTTOMRIGHT", 4, -4)
	--minimapframe : SetClampedToScreen(true)

-------------------------------------------------
---- The frame for zone
local m_zone = FCV.frame ("m_zone", minimapframe, 1, "BACKGROUND", true, true, true)
	m_zone : SetSize (minimap_size+8, 20)
	m_zone : SetPoint ("TOPLEFT", 0, 26)

local m_zone_text = FCV.setfontstring (m_zone, 5, nil, nil, "CENTER")
	m_zone_text : SetFont (minimap_font, font_size)
	m_zone_text : SetPoint ("Center", m_zone, 0, 0)
	m_zone_text : SetJustifyH ("CENTER")
	m_zone_text : SetJustifyV ("CENTER")

-------------------------------------------------
---- The frame for coordinates
local m_coord = FCV.frame ("m_coord", minimapframe, 1, "LOW", true, true, true)
	m_coord : SetSize (72, 20)
	m_coord : SetPoint ("TOPRIGHT", minimapframe, "BOTTOMRIGHT", 0, -6)

local m_coord_text = FCV.setfontstring (m_coord, font_size, nil, nil, "CENTER")
	m_coord_text : SetPoint ("CENTER", 0, 0)
	m_coord_text : SetText ("00, 00")

local ela = 0
local floor = floor
local GetPlayerMapPosition = GetPlayerMapPosition
local coord_Update = function (self, t)
	local form = function(x)
		if floor (x*10+.5) < 1 then
			return "0"
		else
			return ""
		end
	end
	ela = ela - t
	if ela > 0 then return end
	local x, y = GetPlayerMapPosition("player")
	m_coord_text : SetFormattedText("%.1f"..form(x).."|cff00EEFF | |r"..form(y).."%.1f",x*100,y*100)
	ela = .05
end
m_coord : SetScript("OnUpdate", coord_Update)
-------------------------------------------------
	
-------------------------------------------------
---- The frame for mail
local m_mail = FCV.frame ("m_mail", minimapframe, 3, "LOW")
	m_mail : SetSize (24, 24)
	m_mail : SetPoint ("TOP", 0, -5)
	MiniMapMailFrame : ClearAllPoints()
	MiniMapMailFrame : SetParent(m_mail)
	MiniMapMailFrame : SetPoint('CENTER', m_mail, 'CENTER', 1, -2)
	MiniMapMailIcon : SetTexture (CFG.media.mailicon)
-------------------------------------------------
	
-------------------------------------------------
---- The frame for LFG
local m_LFG_BG = FCV.frame ("m_LFG_BG", minimapframe, 3, "LOW")
	m_LFG_BG : SetSize (24, 24)
	m_LFG_BG : SetPoint ("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 4, 4)

	-------------------------------------------------
----  LFG icon on LFG-frame
local function UpdateLFG ()
MiniMapLFGFrame : ClearAllPoints()
MiniMapLFGFrame : SetPoint("CENTER", m_LFG_BG, "CENTER", 0, 0)
MiniMapLFGFrame : SetParent (m_LFG_BG)
MiniMapLFGFrame : SetHighlightTexture(nil)
MiniMapLFGFrameBorder : Hide()
end
hooksecurefunc ("MiniMapLFG_UpdateIsShown", UpdateLFG)

-------------------------------------------------
---- For BG
	MiniMapBattlefieldFrame: ClearAllPoints()
	MiniMapBattlefieldFrame : SetParent (m_LFG_BG)
	MiniMapBattlefieldFrame : SetPoint ("CENTER", m_LFG_BG, "CENTER", 1, -2)

-------------------------------------------------
---- Tracking icon frame
local m_tracking = FCV.frame ("m_tracking", minimapframe, 1, "LOW")
	m_tracking : SetSize (24, 24)
	m_tracking : SetPoint ("TOPLEFT", 5, -5)

----Tracking icon location
	MiniMapTracking : ClearAllPoints ()
	MiniMapTracking : SetParent (m_tracking)
	MiniMapTracking : SetScale (1)
	MiniMapTracking : SetPoint ('CENTER', m_tracking, 0, 0)
-------------------------------------------------

-------------------------------------------------
---- MiniMapInstanceDifficulty frame
local minimap_ID = FCV.frame ("minimap_ID", minimapframe, 5, "LOW")
minimap_ID : SetSize (40, 40)
minimap_ID : ClearAllPoints ()
minimap_ID : SetPoint ("BOTTOMRIGHT", minimapframe, "TOPLEFT", -4, -40)
MiniMapInstanceDifficulty : ClearAllPoints ()
MiniMapInstanceDifficulty : SetParent(minimap_ID)
MiniMapInstanceDifficulty : SetPoint("CENTER", minimap_ID, "CENTER", 0, -5)

-------------------------------------------------
---- Zone show
local zone_show_enable = true
local territory_colors = CFG.territory_colors
local GetZonePVPInfo = GetZonePVPInfo
local GetMinimapZoneText = GetMinimapZoneText
	
local zone_Update = function()
	local z_text  = GetMinimapZoneText ()
	m_zone_text : SetText (z_text)
	local pvp = GetZonePVPInfo() or "none"
	local r, g, b = unpack (CFG.territory_colors[pvp])
	m_zone_text : SetTextColor (r, g, b)
end

m_zone : SetScript ("OnEvent", zone_Update) 
---- zone frame //
-------------------------------------------------

Minimap : SetSize (minimap_size, minimap_size)
Minimap : SetMaskTexture('Interface\\ChatFrame\\ChatFrameBackground')
Minimap : SetFrameStrata("BACKGROUND")
Minimap : SetFrameLevel(3)
------------------------------------------	
-- Масшбирование минимапы 
-- при MouseWheel
------------------------------------------
Minimap : EnableMouseWheel (true)
Minimap : SetScript ("OnMouseWheel", function(self, d)
	if d > 0 then
		_G.MinimapZoomIn : Click()
	elseif d < 0 then
		_G.MinimapZoomOut : Click()
	end
end)

------------------------------------------
---- Move it!
Minimap : SetMovable (true)
Minimap : EnableMouse (true)
Minimap : RegisterForDrag ("LeftButton")
Minimap : SetScript ("OnDragStart",
	function (self) 
		if IsAltKeyDown () then self:StartMoving () end end)
Minimap : SetScript ("OnDragStop", 
	function (self) self : StopMovingOrSizing () end)
Minimap : SetUserPlaced (true)

------------------------------------------
-- Time
if not IsAddOnLoaded("Blizzard_TimeManager") then
	LoadAddOn("Blizzard_TimeManager")
end

-- Timeframe
local m_clockframe = FCV.frame ("m_clockframe", minimapframe, 1, "BACKGROUND", true, true, true)
	m_clockframe : SetSize (48, 20)
	m_clockframe : SetPoint ("TOPLEFT", minimapframe, "BOTTOMLEFT", 0, -6)
--
local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
	clockTime : SetFont (minimap_font, font_size)
	TimeManagerClockButton : SetPoint ("CENTER", m_clockframe, 0, 0)
	--TimeManagerClockButton : SetPoint ("TOPLEFT", minimapframe, "BOTTOMLEFT", 0, -6)
	TimeManagerClockButton : SetScript ("OnMouseDown", function(_,click)
		if click == "RightButton" then
		if not CalendarFrame then
			LoadAddOn ("Blizzard_Calendar")
		end
			CalendarFrame : Show ()
		end
	end)
---- Timeframe	----
------------------------------------------

------------------------------------------	
 ---- MiniMap Config button
 
local minimap_cfg = FCV.frame ("minimap_cfg", minimapframe, 5, "LOW", true, true, true )
	minimap_cfg : SetSize (20, 20)
	minimap_cfg : EnableMouse(true)
	minimap_cfg : SetPoint ("TOPLEFT", minimapframe, "BOTTOMLEFT", 54, -6)
	minimap_cfg : SetScript ("OnEnter", function(self)
		GameTooltip : SetOwner(self, "ANCHOR_BOTTOMLEFT")
		GameTooltip : ClearAllPoints()
		GameTooltip : SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -2)
		GameTooltip : ClearLines ()
		GameTooltip : SetText ("MiniMap config")  -- This sets the top line of text, in gold.
		GameTooltip : AddLine ("MiniMap config в процессе \nразработки", 1, 1, 1)
		GameTooltip : Show ()
end)

minimap_cfg : SetScript ("OnLeave", function() GameTooltip : Hide() end)

local minimap_cfg_text = FCV.setfontstring (minimap_cfg, font_size, nil, nil, "CENTER")
	minimap_cfg_text : SetPoint ("CENTER", -1, 0)
	minimap_cfg_text : SetText ("|cff00EEFFC")

 
------------------------------------------	
-- Right click menu
------------------------------------------
local menuFrame = CreateFrame("Frame", "MinimapRightClickMenu", UIParent, "UIDropDownMenuTemplate")
local menuList = {
    {text = CHARACTER_BUTTON,
    func = function() ToggleCharacter("PaperDollFrame") end},
    {text = SPELLBOOK_ABILITIES_BUTTON,
    func = function() ToggleFrame(SpellBookFrame) end},
    {text = TALENTS_BUTTON,
    func = function() ToggleTalentFrame() end},
    {text = ACHIEVEMENT_BUTTON,
    func = function() ToggleAchievementFrame() end},
    {text = QUESTLOG_BUTTON,
    func = function() ToggleFrame(QuestLogFrame) end},
    {text = SOCIAL_BUTTON,
    func = function() ToggleFriendsFrame(1) end},
	{text = PLAYER_V_PLAYER,
	func = function() ToggleFrame(PVPFrame) end},
    {text = LFG_TITLE,
    func = function() ToggleFrame(LFDParentFrame) end},
    {text = L_LFRAID,
    func = function() ToggleFrame(LFRParentFrame) end},
    {text = HELP_BUTTON,
    func = function() ToggleHelpFrame() end},
    {text = "Календарь", 
    func = function()
    if(not CalendarFrame) then LoadAddOn("Blizzard_Calendar") end
        Calendar_Toggle()
    end},
}

Minimap : SetScript("OnMouseUp", function(self, button)
	if button == "RightButton" and not InCombatLockdown() then
		EasyMenu(menuList, menuFrame, "cursor", 0, 0, "MENU", 2)
	else
		Minimap_OnClick(self)
	end
end)
  
if IsAddOnLoaded("SumakMinimap") then
	UpdateAddOnMemoryUsage()
	printAddonInfo ()
end
 
 ------------------------------------------
-- Скрываем минимапбордеры

FCV.kill(WatchFrame)		--список задач
FCV.kill(MinimapBorderTop) -- hide minimap border
FCV.kill(MinimapBorder)	   -- hide minimap border
FCV.kill(MinimapNorthTag)
FCV.kill(MinimapZoneTextButton)
FCV.kill(MinimapZoomOut)	-- hide zoom button
FCV.kill(MinimapZoomIn)	-- hide zoom button
FCV.kill(MiniMapVoiceChatFrame)	-- Hide Voice Chat Frame
FCV.kill(MiniMapWorldMapButton)
FCV.kill(MiniMapMailBorder)	-- hide mail border
FCV.kill(MiniMapBattlefieldBorder)
FCV.kill(MiniMapTrackingBackground) -- бекграунд на трекере
FCV.kill(MiniMapTrackingButtonBorder) -- бордер на трекере
FCV.kill(GameTimeFrame)
FCV.kill(clockFrame)
MinimapNorthTag:SetTexture(nil)


SLASH_RESETMINIMAP1 = "/rmmp"
SLASH_RESETMINIMAP1 = "/resetmmp"

m_zone:RegisterEvent("PLAYER_ENTERING_WORLD")
m_zone:RegisterEvent("ZONE_CHANGED_NEW_AREA")
m_zone:RegisterEvent("ZONE_CHANGED")
m_zone:RegisterEvent("ZONE_CHANGED_INDOORS")
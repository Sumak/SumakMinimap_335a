---------------------------------------------
---- media.lua
---------------------------------------------
local FCV, CFG, LOC = unpack(select(2, ...))

mediapath = "Interface\\AddOns\\SumakCore\\media\\"

CFG["media"] = {
	---- fonts
	["fontsize"] = 12, 									    -- Размер шрифта 
	["font"] = mediapath..[=[fonts\ARIALN.TTF]=], 			-- основной шрифт
	["uffont"] = mediapath..[=[fonts\uf_font.ttf]=],		-- шрифт юнитфреймов
	---- textures
	["normTex"] = mediapath..[=[img\normTex]=], 	-- texture used for tukui healthbar/powerbar/etc
	["glowTex"] = mediapath..[=[img\glowTex]=], 	-- the glow text around some frame.
	["bubbleTex"] = mediapath..[=[img\bubbleTex]=], -- unitframes combo points
	["blank"] = mediapath..[=[img\blank]=],			-- the main texture for all borders/panels
--  ["blank"] = [[Interface\\Buttons\\WHITE8x8]],
	["bordercolor"] = { .3,.3,.3,1 }, -- border color of tukui panels
	["altbordercolor"] = { .4,.4,.4,1 }, -- alternative border color, mainly for unitframes text panels.
	["backdropcolor"] = { .1,.1,.1,1 }, -- background color of tukui panels
	["buttonhover"] = mediapath..[=[img\button_hover]],
	--["bgfile"] = [=[Interface\ChatFrame\ChatFrameBackground]=],
	["bgfile"] =[=[Interface\ChatFrame\ChatFrameBackground]=],
  ["texture"] = mediapath..[=[img\statusbar.tga]=],
	["minimaparrow"] = mediapath..[=[img\MinimapArrow.blp]=],
	["mailicon"] = mediapath..[=[img\mail.tga]=],
	["minimap_mask_texture"] = [[Interface\ChatFrame\ChatFrameBackground]]
}

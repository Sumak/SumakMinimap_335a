---------------------------------------------
--Grid.lua
---------------------------------------------

local FCV, CFG = unpack (SumakDB)

local gridSize = 64
local grid


local to_hide = function (self)
	if self.hiding == true then return end
	self : Hide()
	self.showing = false
end

local to_show = function (self)
	if self.showing == true then return end
	self : Show()
	UIFrameFadeIn (grid, 1, 0, 1)
	self.showing = true
end
	
---- Make GRID  -----
function FCV.Grid_Create () 
	grid = CreateFrame ('Frame', 'UIGrid', UIParent) 
	grid : SetAllPoints (UIParent) 
	grid.hide = to_hide
	grid.show = to_show
	grid : SetAlpha (0)
	
	local size = 1 
	local width = GetScreenWidth ()
	local ratio = width / GetScreenHeight ()
	local height = GetScreenHeight () * ratio

	local wStep = width / gridSize
	local hStep = height / gridSize

	for i = 0, gridSize do 
		local tx = grid : CreateTexture(nil, 'BACKGROUND') 
		if i == gridSize / 2 then 
			tx : SetTexture (1, 0, 0) 
		else 
			tx : SetTexture (0, 0, 0) 
		end 
		tx : SetPoint ("TOPLEFT", grid, "TOPLEFT", i*wStep - (size/2), 0) 
		tx : SetPoint ('BOTTOMRIGHT', grid, 'BOTTOMLEFT', i*wStep + (size/2), 0) 
	end 
	height = GetScreenHeight ()
	
	do
		local tx = grid : CreateTexture (nil, 'BACKGROUND') 
		tx : SetTexture (1, 0, 0)
		tx : SetPoint ("TOPLEFT", grid, "TOPLEFT", 0, -(height/2) + (size/2))
		tx : SetPoint ('BOTTOMRIGHT', grid, 'TOPRIGHT', 0, -(height/2 + size/2))
	end
	
	for i = 1, floor ((height/2)/hStep) do
		local tx = grid : CreateTexture (nil, 'BACKGROUND') 
		tx : SetTexture(0, 0, 0)
		
		tx : SetPoint ("TOPLEFT", grid, "TOPLEFT", 0, -(height/2+i*hStep) + (size/2))
		tx : SetPoint ('BOTTOMRIGHT', grid, 'TOPRIGHT', 0, -(height/2+i*hStep + size/2))
		
		tx = grid : CreateTexture(nil, 'BACKGROUND') 
		tx : SetTexture(0, 0, 0)
		
		tx : SetPoint ("TOPLEFT", grid, "TOPLEFT", 0, -(height/2-i*hStep) + (size/2))
		tx : SetPoint ('BOTTOMRIGHT', grid, 'TOPRIGHT', 0, -(height/2-i*hStep + size/2))
	end
	grid : show ()
end

-------------------------------------------------
---- включение Grid

local Grid_Show = function () 
	if not grid then 
		FCV.Grid_Create () 
	return
	elseif grid.showing == true then 
		grid : hide () 
	return
	else
		grid : show ()
	return
	end
end

SlashCmdList.GRIDSHOW = Grid_Show

SLASH_GRIDSHOW1 = "/gr"
SLASH_GRIDSHOW2 = "/пк"

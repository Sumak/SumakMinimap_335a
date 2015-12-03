local FCV = unpack(select(2, ...))

------------------------------------------
-- destroy function
FCV.kill = function(self, donthide, point)
	if not self then return end
	if self.UnregisterAllEvents then self:UnregisterAllEvents() end
	if self.SetPoint and not(point) then self.SetPoint = FCV.null end
	if self.Show then self.Show = FCV.null end
	if not donthide then self:Hide() end
	if self.Hide then self.Hide = FCV.null end
end
------------------------------------------
--[[
-- Function Kill
dummy = function() return end
function Kill(object)
	object.Show = dummy
	object:SetAlpha(0)
	object:Hide()
end

]]
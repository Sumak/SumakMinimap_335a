------------------------------------------------------------------------
--	ReloadUI command
------------------------------------------------------------------------
--local ns = select(2,...)
--ns[1] = SumakUI[1] -- FCV
--ns[2] = SumakUI[2] -- CFG

local FCV, CFG = unpack (SumakDB)

----перезагрузка UI
-------------------------------------------------
SlashCmdList.RELOADUI = ReloadUI

SLASH_RELOADUI1 = "/rl"
SLASH_RELOADUI2 = "/кд"

----исправление невыхода из группы 
-------------------------------------------------
local PartyBye = function () 
	if GetNumPartyMembers () >0 then
		LeaveParty ()
	else FCV.ChatAlert ("Вы не состоите в группе!")
	end
end

SlashCmdList.Leave_Party = PartyBye

SLASH_Leave_Party1 = "/lp"
SLASH_Leave_Party2  = "/дз"



------------------------------------------------------------------------
--	ReloadUI command
------------------------------------------------------------------------
SlashCmdList.RELOADUI = ReloadUI

SLASH_RELOADUI1 = "/rl"
SLASH_RELOADUI2 = "/кд"

----исправление невыхода из группы 
-------------------------------------------------
local PartyBye = function () 
    LeaveParty()
end

SlashCmdList.Leave_Party = PartyBye

SLASH_Leave_Party1 = "/lp"
SLASH_Leave_Party2  = "/дз"
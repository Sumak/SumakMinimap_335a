-------------------------------------------------
---- init.lua
-- initiation of SumakMinimap
-------------------------------------------------
--[[

Это долно быть в каждом аддоне в самом начале:	
		local FCV, CFG, LOC = unpack(select(2, ...))

Так другие аддоны смогут использовать SumakUI engine
		local FCV, CFG, LOC = unpack(SumakUI)

--- Для того, чтобы другой аддон мог использовать 
---- engine SumakUI нужно импортировать данные

FCV - функции, константы, переменные
CFG - конфигурация
LOC - локализация (введено, но хз пригодится ли ...)

]]
----------------------------------------------------------------
-- Initiation engine
----------------------------------------------------------------

-- including system
local ns = select(2,...)
ns[1] = { } -- FCV, functions, constants, variables
ns[2] = { } -- CFG, config
ns[3] = { }-- LOC, localization
_G.SumakDB = ns -- Allow other addons to use Engine

local FCV, CFG, LOC = unpack(_G.SumakDB)


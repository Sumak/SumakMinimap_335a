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
local addon, engine = ...
engine[1] = { } -- FCV, functions, constants, variables
engine[2] = { } -- CFG, config
engine[3] = { }-- LOC, localization

SumakUI = engine -- Allow other addons to use Engine

local FCV, CFG, LOC = unpack(select(2, ...))


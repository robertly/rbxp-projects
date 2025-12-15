--[[
	Sets up the Heads Up Display (HUD), which includes:
		- Player profile icon/name
		- Objective banner
		- Crosshair
--]]

local Players = game:GetService("Players")

local setPlayerPortrait = require(script.setPlayerPortrait)
local setPlayerName = require(script.setPlayerName)
local startSyncingTeamColor = require(script.startSyncingTeamColor)
local setObjective = require(script.setObjective)
local setupTouchButtonAsync = require(script.setupTouchButtonAsync)
local startSyncingTeamPoints = require(script.startSyncingTeamPoints)
local disableMouseWhileGuiEnabled = require(script.disableMouseWhileGuiEnabled)
local setupHitmarker = require(script.setupHitmarker)

local localPlayer = Players.LocalPlayer
local gui = localPlayer.PlayerGui:WaitForChild("HUDGui")

setPlayerPortrait(gui)
setPlayerName(gui)
startSyncingTeamColor(gui)
setObjective(gui)
startSyncingTeamPoints(gui)
disableMouseWhileGuiEnabled(gui)
setupHitmarker(gui)
setupTouchButtonAsync(gui)

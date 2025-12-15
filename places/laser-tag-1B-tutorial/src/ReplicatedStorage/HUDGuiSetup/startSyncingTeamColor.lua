--[[
	Sets the player's team icon for the HUD Gui according to what team the player is on.
--]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GuiAttribute = require(ReplicatedStorage.GuiAttribute)

local localPlayer = Players.LocalPlayer

local function setPlayerTeamIcon(gui: ScreenGui)
	for _, teamColorIcon in gui.PlayerDisplay.TeamIcons:GetChildren() do
		local iconTeamColor = teamColorIcon:GetAttribute(GuiAttribute.teamColor)
		teamColorIcon.Visible = localPlayer.TeamColor == iconTeamColor
	end
end

local function startSyncingTeamColor(gui: ScreenGui)
	setPlayerTeamIcon(gui)

	localPlayer:GetPropertyChangedSignal("Team"):Connect(function()
		setPlayerTeamIcon(gui)
	end)
end

return startSyncingTeamColor

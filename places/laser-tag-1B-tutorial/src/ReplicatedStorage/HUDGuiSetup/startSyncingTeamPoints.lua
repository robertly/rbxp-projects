--[[
	Keeps the team points indicator up to date in the HUD Gui
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")

local GuiAttribute = require(ReplicatedStorage.GuiAttribute)

local function getTeamFromTeamColor(teamColor: Color3): Team?
	for _, team in Teams:GetTeams() do
		if team.TeamColor == teamColor then
			return team
		end
	end

	return nil
end

local function startSyncingTeamPoints(gui: ScreenGui)
	for _, teamPointCounter in gui.Objective.TeamPointCounter:GetChildren() do
		if not teamPointCounter:IsA("GuiObject") then
			continue
		end

		local iconTeamColor = teamPointCounter:GetAttribute(GuiAttribute.teamColor)

		local team = getTeamFromTeamColor(iconTeamColor)
		if not team then
			warn(`No team found matching the color {iconTeamColor} to sync team points on {teamPointCounter}`)
			continue
		end

		teamPointCounter.TextLabel.Text = team:GetAttribute(GuiAttribute.teamPoints)

		team:GetAttributeChangedSignal(GuiAttribute.teamPoints):Connect(function()
			teamPointCounter.TextLabel.Text = team:GetAttribute(GuiAttribute.teamPoints)
		end)
	end
end

return startSyncingTeamPoints

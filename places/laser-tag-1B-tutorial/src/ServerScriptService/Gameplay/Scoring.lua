--[[
	Provides functions to reset all scores and increment a player's score.
	When a player's score is incremented, both their individual leaderstats points
	and the total team points get updated.

	A bindable event is fired when the team's score changes, used for checking if the round should end.
--]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")

local GuiAttribute = require(ReplicatedStorage.GuiAttribute)

local teamScoreChangedBindable = Instance.new("BindableEvent")

local Scoring = {
	teamScoreChanged = teamScoreChangedBindable.Event,
}

function Scoring.resetScores()
	for _, player in Players:GetPlayers() do
		player.leaderstats.Points.Value = 0
	end

	for _, team in Teams:GetTeams() do
		team:SetAttribute(GuiAttribute.teamPoints, 0)
	end
end

function Scoring.incrementScore(player: Player, amount: number)
	local team = player.Team
	assert(team, `Player {player.Name} must be on a team to score a point, but has no team`)

	local teamPoints = team:GetAttribute(GuiAttribute.teamPoints)
	teamPoints += amount
	team:SetAttribute(GuiAttribute.teamPoints, teamPoints)

	local leaderstat = player.leaderstats.Points
	leaderstat.Value += amount

	teamScoreChangedBindable:Fire(team, teamPoints)
end

return Scoring

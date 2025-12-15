local Teams = game:GetService("Teams")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerState = require(ReplicatedStorage.PlayerState)
local PlayerAttribute = require(ReplicatedStorage.PlayerAttribute)

local function getSmallestTeam(): Team
	local teams = Teams:GetTeams()

	-- Sort teams in ascending order from smallest to largest
	table.sort(teams, function(teamA: Team, teamB: Team)
		return #teamA:GetPlayers() < #teamB:GetPlayers()
	end)

	-- Return the smallest team
	return teams[1]
end

local function spawnPlayersInMap(players: { Player })
	for _, player in players do
		player.Team = getSmallestTeam()
		player.Neutral = false
		player:SetAttribute(PlayerAttribute.playerState, PlayerState.SelectingBlaster)
		task.spawn(function()
			player:LoadCharacter()
		end)
	end
end

return spawnPlayersInMap

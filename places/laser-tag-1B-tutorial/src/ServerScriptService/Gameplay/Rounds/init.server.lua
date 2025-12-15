local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Scoring = require(script.Parent.Scoring)
local spawnPlayersInMap = require(script.spawnPlayersInMap)
local spawnPlayersInLobby = require(script.spawnPlayersInLobby)
local TEAM_SCORE_LIMIT = require(ReplicatedStorage.TEAM_SCORE_LIMIT)

local roundWinnerRemote = ReplicatedStorage.Instances.RoundWinnerEvent
local neutralSpawn = Workspace.World.Map.Spawns.NeutralSpawn

local INTERMISSION_TIME = 10

local function startRoundLoopAsync()
	while true do
		-- Reset scores
		Scoring.resetScores()

		-- Spawn all players in the map
		neutralSpawn.Neutral = false
		spawnPlayersInMap(Players:GetPlayers())

		-- Spawn new players in the map when they join
		local playerAddedConnection = Players.PlayerAdded:Connect(function(player: Player)
			spawnPlayersInMap({ player })
		end)

		-- Check if the round has finished after each score
		local team: Team
		local score: number = 0

		while score < TEAM_SCORE_LIMIT do
			team, score = Scoring.teamScoreChanged:Wait()
		end

		-- Display winning team
		for _, player in Players:GetPlayers() do
			-- Sending what team the player is on at the end of the round
			-- because the player's team is about to be removed, so the client
			-- won't be able to check its own team
			roundWinnerRemote:FireClient(player, team, player.Team)
		end

		-- Send everyone to the lobby
		playerAddedConnection:Disconnect()
		neutralSpawn.Neutral = true
		spawnPlayersInLobby(Players:GetPlayers())

		-- Wait for intermission
		task.wait(INTERMISSION_TIME)
	end
end

task.spawn(startRoundLoopAsync)

--[[
	Sets up the team indicators over other players while playing a round, which is a small circle over other players' heads.
	Indicators are only shown for players participating in the round.
	Indicators are colored based on the player's team.
	Indicators are always on top only if the player is friendly.
--]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer
local otherPlayerIndicatorPrefab = ReplicatedStorage.Instances.Guis.OtherPlayerIndicatorPrefab

local characterSpawnConnectionsByPlayer: { [Player]: RBXScriptConnection } = {}
local playerAddedConnection: RBXScriptConnection?

local function removeIndicatorFromPlayer(player: Player)
	if not player.Character then
		return
	end

	local head = player.Character:WaitForChild("Head", 3)
	if not head then
		return
	end

	local gui = head:FindFirstChild(otherPlayerIndicatorPrefab.Name)
	if gui then
		gui:Destroy()
	end
end

local function addIndicatorToCharacter(otherCharacter: Model?)
	local otherPlayer = Players:GetPlayerFromCharacter(otherCharacter)
	if not otherPlayer then
		return
	end

	task.spawn(function()
		local otherHead = otherCharacter:WaitForChild("Head", 3)
		if not otherHead then
			return
		end

		-- Only add indicators to players participating in the round
		if not otherPlayer.Team then
			return
		end

		-- Avoid adding duplicate indicators, creating a new one only if it doesn't exist
		local gui = otherHead:FindFirstChild(otherPlayerIndicatorPrefab.Name)
		if not gui then
			gui = otherPlayerIndicatorPrefab:Clone()
			gui.Frame.BackgroundColor3 = otherPlayer.TeamColor.Color
			gui.Parent = otherHead
		end

		-- The indicator is always on top only if the player is friendly

		local isFriendly = otherPlayer.Team == localPlayer.Team
		gui.AlwaysOnTop = isFriendly
	end)
end

local function addIndicatorWhenCharacterSpawns(player: Player)
	if characterSpawnConnectionsByPlayer[player] then
		return
	end
	local connection = player.CharacterAdded:Connect(addIndicatorToCharacter)
	characterSpawnConnectionsByPlayer[player] = connection
end

local function stopSyncingIndicators()
	for _, connection in characterSpawnConnectionsByPlayer do
		connection:Disconnect()
	end
	table.clear(characterSpawnConnectionsByPlayer)

	if playerAddedConnection then
		playerAddedConnection:Disconnect()
		playerAddedConnection = nil
	end

	for _, player in Players:GetPlayers() do
		removeIndicatorFromPlayer(player)
	end
end

local function addIndicatorToPlayer(player: Player)
	if player == localPlayer then
		return
	end

	addIndicatorToCharacter(player.Character)
	addIndicatorWhenCharacterSpawns(player)
end

local function startSyncingIndicators()
	for _, player in Players:GetPlayers() do
		addIndicatorToPlayer(player)
	end

	if not playerAddedConnection then
		playerAddedConnection = Players.PlayerAdded:Connect(addIndicatorToPlayer)
	end
end

local function onLocalTeamChanged()
	local localTeam = localPlayer.Team
	if localTeam then
		startSyncingIndicators()
	else
		stopSyncingIndicators()
	end
end

localPlayer:GetPropertyChangedSignal("Team"):Connect(onLocalTeamChanged)
onLocalTeamChanged()

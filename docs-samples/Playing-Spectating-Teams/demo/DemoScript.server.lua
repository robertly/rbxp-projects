local Players = game:GetService("Players")
local Teams = game:GetService("Teams")

local teamPlaying = Teams.Playing
local teamSpectators = Teams.Spectating

local playCommand = "/play"

local function play(player)
	player.Team = teamPlaying
	player.TeamColor = teamPlaying.TeamColor
	-- Respawn the player (moves them to spawn location)
	player:LoadCharacter()
end

local function onPlayerDied(player, _character)
	-- When someone dies, put them on the spectator team
	player.Team = teamSpectators
end

local function onPlayerSpawned(player, character)
	local human = character:WaitForChild("Humanoid")
	human.Died:Connect(function()
		onPlayerDied(player, character)
	end)
end

local function onPlayerChatted(player, message)
	if message:sub(1, playCommand:len()):lower() == playCommand then
		play(player)
	end
end

local function onPlayerAdded(player)
	if player.Character then
		onPlayerSpawned(player, player.Character)
	end
	player.CharacterAdded:Connect(function()
		onPlayerSpawned(player, player.Character)
	end)
	player.Chatted:Connect(function(message, _recipient)
		onPlayerChatted(player, message)
	end)
end

for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
Players.PlayerAdded:Connect(onPlayerAdded)

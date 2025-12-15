local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local PLAYER_NAME = "Nightriff"

local character = Workspace:FindFirstChild(PLAYER_NAME)
local player = Players:GetPlayerFromCharacter(character)

if player then
	print(`Player {player.Name} ({player.UserId}) is in the game`)
else
	print(`Player {PLAYER_NAME} is not in the game!`)
end

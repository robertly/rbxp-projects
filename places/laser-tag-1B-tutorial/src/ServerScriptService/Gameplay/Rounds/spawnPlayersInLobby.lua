local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerState = require(ReplicatedStorage.PlayerState)
local PlayerAttribute = require(ReplicatedStorage.PlayerAttribute)

local function spawnPlayersInLobby(players: { Player })
	for _, player in players do
		player.Neutral = true
		player:SetAttribute(PlayerAttribute.playerState, PlayerState.InLobby)
		task.spawn(function()
			player:LoadCharacter()
		end)
	end
end

return spawnPlayersInLobby

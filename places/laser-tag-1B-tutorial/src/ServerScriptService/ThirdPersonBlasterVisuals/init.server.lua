--[[
	Creates a third-person view model blaster for other players to see what blaster
	a player has.

	This model is invisible in first-person because it's inside the character,
	and all parts in the character become locally invisible while in first-person.
--]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerAttribute = require(ReplicatedStorage.PlayerAttribute)
local PlayerState = require(ReplicatedStorage.PlayerState)
local createThirdPersonModel = require(script.createThirdPersonModel)

local connectionsByPlayer: { [Player]: { RBXScriptConnection } } = {}

local function onPlayerAdded(player: Player)
	connectionsByPlayer[player] = {}

	-- Update third person blaster visuals when the player's blaster changes during a round
	local attributeChangedConnection = player:GetAttributeChangedSignal(PlayerAttribute.blasterType):Connect(function()
		createThirdPersonModel(player)
	end)
	table.insert(connectionsByPlayer[player], attributeChangedConnection)

	-- Update third person blaster visuals when the player initially selects their blaster
	local playerStateChangedConnection = player
		:GetAttributeChangedSignal(PlayerAttribute.playerState)
		:Connect(function()
			local newPlayerState = player:GetAttribute(PlayerAttribute.playerState)
			if newPlayerState == PlayerState.Playing then
				createThirdPersonModel(player)
			end
		end)
	table.insert(connectionsByPlayer[player], playerStateChangedConnection)
end

local function onPlayerRemoving(player: Player)
	local connections = connectionsByPlayer[player]
	for _, connection in connections do
		connection:Disconnect()
	end
	connectionsByPlayer[player] = nil
end

-- Call onPlayerAdded for any players already in the game
for _, player in Players:GetPlayers() do
	onPlayerAdded(player)
end

-- Call onPlayerAdded for all future players
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

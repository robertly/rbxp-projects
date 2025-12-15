local Players = game:GetService("Players")

local connectionByPlayer: { [Player]: RBXScriptConnection } = {}

local function onCharacterAppearanceLoaded(character: Model)
	-- All accessories have loaded at this point
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	local numAccessories = #humanoid:GetAccessories()
	print(`Destroying {numAccessories} accessories for {character.Name}`)
	humanoid:RemoveAccessories()
end

local function onPlayerAdded(player: Player)
	local connection = player.CharacterAppearanceLoaded:Connect(onCharacterAppearanceLoaded)

	connectionByPlayer[player] = connection
end

-- Disconnect the connection when the player leaves to prevent a memory leak
local function onPlayerRemoving(player: Player)
	connectionByPlayer[player]:Disconnect()
	connectionByPlayer[player] = nil
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

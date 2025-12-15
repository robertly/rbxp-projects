local Players = game:GetService("Players")

local function onCharacterAdded(character)
	print(character.Name .. " has spawned")
end

local function onCharacterRemoving(character)
	print(character.Name .. " is despawning")
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
	player.CharacterRemoving:Connect(onCharacterRemoving)
end

Players.PlayerAdded:Connect(onPlayerAdded)

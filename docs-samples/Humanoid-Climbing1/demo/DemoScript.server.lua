local Players = game:GetService("Players")

local function onCharacterClimbing(character, speed)
	print(character.Name, "is climbing at a speed of", speed, "studs / second.")
end

local function onCharacterAdded(character)
	character.Humanoid.Climbing:Connect(function(speed)
		onCharacterClimbing(character, speed)
	end)
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)

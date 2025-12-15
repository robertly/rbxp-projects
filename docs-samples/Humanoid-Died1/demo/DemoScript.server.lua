local Players = game:GetService("Players")

local function onPlayerAdded(player)
	local function onCharacterAdded(character)
		local humanoid = character:WaitForChild("Humanoid")

		local function onDied()
			print(player.Name, "has died!")
		end

		humanoid.Died:Connect(onDied)
	end

	player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)

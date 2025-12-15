local Players = game:GetService("Players")

local function onPlayerAdded(player)
	local function onCharacterAdded(character)
		-- wait for the head to be added
		local head = character:WaitForChild("Head")

		local sound = Instance.new("Sound")
		sound.Name = "TestSound"
		sound.SoundId = "rbxasset://sounds/uuhhh.mp3" -- oof
		sound.Parent = head

		sound.Looped = true

		sound.DidLoop:Connect(function(_soundId, numOfTimesLooped)
			print("oof! " .. tostring(numOfTimesLooped))
		end)

		sound:Play()
	end

	player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)

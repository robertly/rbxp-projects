local Players = game:GetService("Players")

-- Set CharacterAutoLoads to false
Players.CharacterAutoLoads = false

-- Remove player's character from workspace on death
Players.PlayerAdded:Connect(function(player)
	while true do
		local char = player.CharacterAdded:Wait()
		char.Humanoid.Died:Connect(function()
			char:Destroy()
		end)
	end
end)

-- Respawn all dead players once every 10 seconds
while true do
	local players = Players:GetChildren()

	-- Check if each player is dead by checking if they have no character, if dead load that player's character
	for _, player in pairs(players) do
		if not workspace:FindFirstChild(player.Name) then
			player:LoadCharacter()
		end
	end

	-- Wait 10 seconds until next respawn check
	task.wait(10)
end

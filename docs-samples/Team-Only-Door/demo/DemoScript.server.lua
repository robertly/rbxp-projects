local Players = game:GetService("Players")

local door = Instance.new("Part")
door.Anchored = true
door.Size = Vector3.new(7, 10, 1)
door.Position = Vector3.new(0, 5, 0)
door.Parent = workspace

local debounce = false

door.Touched:Connect(function(hit)
	if not debounce then
		debounce = true
		if hit then
			local player = Players:GetPlayerFromCharacter(hit.Parent)
			if player and player.TeamColor == BrickColor.new("Bright red") then
				door.Transparency = 0.5
				door.CanCollide = false
				task.wait(3)
				door.Transparency = 0
				door.CanCollide = true
			end
		end
		task.wait(0.5)
		debounce = false
	end
end)

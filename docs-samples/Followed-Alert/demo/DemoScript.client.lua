local Players = game:GetService("Players")

local player = Players.LocalPlayer

local function onPlayerAdded(newPlayer)
	if newPlayer.FollowUserId == player.UserId then
		local hint = Instance.new("Hint")
		hint.Parent = player:WaitForChild("PlayerGui")
		hint.Text = "You were followed to this game by " .. newPlayer.Name .. "!"
		task.delay(3, function()
			if hint then
				hint:Destroy()
			end
		end)
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

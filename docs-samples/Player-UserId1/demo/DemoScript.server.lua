local Players = game:GetService("Players")

local function onPlayerAdded(player)
	print(player.UserId)
end

Players.PlayerAdded:Connect(onPlayerAdded)

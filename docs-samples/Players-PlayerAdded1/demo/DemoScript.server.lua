local Players = game:GetService("Players")

local function onPlayerAdded(player)
	print("A player has entered: " .. player.Name)
end

Players.PlayerAdded:Connect(onPlayerAdded)

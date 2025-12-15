local Players = game:GetService("Players")

local function onPlayerRemoving(player)
	print("A player has left: " .. player.Name)
end

Players.PlayerRemoving:Connect(onPlayerRemoving)

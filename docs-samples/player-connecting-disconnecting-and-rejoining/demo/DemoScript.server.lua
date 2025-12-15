local Players = game:GetService("Players")

Players.PlayerConnecting:Connect(function(player)
	print(player.Name .. " connecting!")
end)

Players.PlayerDisconnecting:Connect(function(player)
	print(player.Name .. " disconnecting!")
end)

Players.PlayerRejoining:Connect(function(player)
	print(player.Name .. " rejoining!")
end)

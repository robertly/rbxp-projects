local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	local playerOnTeleport = player
	player.OnTeleport:Connect(function(teleportState, _placeId, _spawnName)
		if teleportState == Enum.TeleportState.Started then
			print("Teleport started (" .. playerOnTeleport.Name .. ")")
		elseif teleportState == Enum.TeleportState.WaitingForServer then
			print("Teleport waiting for server (" .. playerOnTeleport.Name .. ")")
		elseif teleportState == Enum.TeleportState.InProgress then
			print("Teleport in progress (" .. playerOnTeleport.Name .. ")")
		elseif teleportState == Enum.TeleportState.Failed then
			print("Teleport failed! (" .. playerOnTeleport.Name .. ")")
		end
	end)
end)

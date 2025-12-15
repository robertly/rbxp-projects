local Players = game:GetService("Players")

local function onPlayerAdded(player)
	if player:IsFriendsWith(146569) then
		print(player.Name .. " is friends with gordonrox24!")
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

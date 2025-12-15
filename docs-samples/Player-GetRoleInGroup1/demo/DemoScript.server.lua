local Players = game:GetService("Players")

local function onPlayerAdded(player)
	print("Player is ranked as '", player:GetRoleInGroup(2), "' in group, 'LOL'!")
end

Players.PlayerAdded:Connect(onPlayerAdded)

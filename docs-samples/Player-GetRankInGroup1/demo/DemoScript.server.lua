local Players = game:GetService("Players")

local function onPlayerAdded(player)
	if player:GetRankInGroup(2) == 255 then
		print("Player is the owner of the group, 'LOL'!")
	else
		print("Player is NOT the owner of the group, 'LOL'!")
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

local Players = game:GetService("Players")

local function onPlayerAdded(player)
	if player:IsInGroup(7) then
		print("Player is in the Roblox Fan club!")
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

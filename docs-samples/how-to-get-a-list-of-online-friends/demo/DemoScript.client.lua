local Players = game:GetService("Players")

local player = Players.LocalPlayer

local success, result = pcall(player.GetFriendsOnline, player, 10)

if success then
	for _, friend in pairs(result) do
		print(friend.UserName)
	end
else
	warn("Failed to get online players: " .. result)
end

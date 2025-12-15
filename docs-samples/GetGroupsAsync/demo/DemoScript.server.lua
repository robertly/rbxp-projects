local GroupService = game:GetService("GroupService")
local Players = game:GetService("Players")

local function playerAdded(player)
	-- load a list of info on all groups the player is a member of
	local groups = GroupService:GetGroupsAsync(player.UserId)

	for _, groupInfo in pairs(groups) do
		for key, value in pairs(groupInfo) do
			print(key .. ": " .. tostring(value))
		end

		print("--")
	end
end

Players.PlayerAdded:Connect(playerAdded)

-- go through existing players
for _, player in pairs(Players:GetPlayers()) do
	playerAdded(player)
end

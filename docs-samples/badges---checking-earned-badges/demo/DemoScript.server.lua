local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")

local badgeId = 00000000 -- Change this to your badge ID

local function onPlayerAdded(player)
	-- Check if the player has the badge
	local success, hasBadge = pcall(function()
		return BadgeService:UserHasBadgeAsync(player.UserId, badgeId)
	end)

	-- If there's an error, issue a warning and exit the function
	if not success then
		warn("Error while checking if player has badge!")
		return
	end

	if hasBadge then
		-- Handle player's badge ownership as needed
		print(player.Name, "has badge", badgeId)
	end
end

-- Connect "PlayerAdded" events to the "onPlayerAdded()" function
Players.PlayerAdded:Connect(onPlayerAdded)

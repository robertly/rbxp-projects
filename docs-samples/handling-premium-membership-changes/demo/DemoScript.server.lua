local Players = game:GetService("Players")

local function grantPremiumBenefits(player)
	-- Grant the player access to Premium-only areas, items, or anything you can imagine!
	print("Giving", player, "premium benefits!")
end

local function playerAdded(player)
	if player.MembershipType == Enum.MembershipType.Premium then
		grantPremiumBenefits(player)
	end
end

local function playerMembershipChanged(player)
	print("Received event PlayerMembershipChanged. New membership = " .. tostring(player.MembershipType))
	if player.MembershipType == Enum.MembershipType.Premium then
		grantPremiumBenefits(player)
	end
end

Players.PlayerAdded:Connect(playerAdded)
Players.PlayerMembershipChanged:Connect(playerMembershipChanged)

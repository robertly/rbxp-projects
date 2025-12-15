local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- The bundle we're checking for: https://www.roblox.com/bundles/589/Junkbot
local BUNDLE_ID = 589
local BUNDLE_NAME = "Junkbot"

Players.PlayerAdded:Connect(function(player)
	local success, doesPlayerOwnBundle = pcall(function()
		return MarketplaceService:PlayerOwnsBundle(player, BUNDLE_ID)
	end)

	if success == false then
		print("PlayerOwnsBundle call failed: ", doesPlayerOwnBundle)
		return
	end

	if doesPlayerOwnBundle then
		print(player.Name .. " owns " .. BUNDLE_NAME)
	else
		print(player.Name .. " doesn't own " .. BUNDLE_NAME)
	end
end)

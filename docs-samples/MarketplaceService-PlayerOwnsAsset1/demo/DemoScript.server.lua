local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- The item we're checking for: https://www.roblox.com/catalog/30331986/Midnight-Shades
local ASSET_ID = 30331986
local ASSET_NAME = "Midnight Shades"

local function onPlayerAdded(player)
	local success, doesPlayerOwnAsset = pcall(MarketplaceService.PlayerOwnsAsset, MarketplaceService, player, ASSET_ID)
	if not success then
		local errorMessage = doesPlayerOwnAsset
		warn(`Error checking if {player.Name} owns {ASSET_NAME}: {errorMessage}`)
		return
	end

	if doesPlayerOwnAsset then
		print(`{player.Name} owns {ASSET_NAME}`)
	else
		print(`{player.Name} doesn't own {ASSET_NAME}`)
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

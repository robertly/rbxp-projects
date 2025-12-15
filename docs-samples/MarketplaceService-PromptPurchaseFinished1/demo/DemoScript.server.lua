local MarketplaceService = game:GetService("MarketplaceService")

local function onPromptPurchaseFinished(player, assetId, isPurchased)
	if isPurchased then
		print(player.Name, "bought an item with AssetID:", assetId)
	else
		print(player.Name, "didn't buy an item with AssetID:", assetId)
	end
end

MarketplaceService.PromptPurchaseFinished:Connect(onPromptPurchaseFinished)

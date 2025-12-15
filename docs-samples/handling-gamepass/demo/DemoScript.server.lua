local MarketplaceService = game:GetService("MarketplaceService")

local function gamepassPurchaseFinished(...)
	-- Print all the details of the prompt, for example:
	-- PromptGamePassPurchaseFinished PlayerName 123456 false
	print("PromptGamePassPurchaseFinished", ...)
end

MarketplaceService.PromptGamePassPurchaseFinished:Connect(gamepassPurchaseFinished)

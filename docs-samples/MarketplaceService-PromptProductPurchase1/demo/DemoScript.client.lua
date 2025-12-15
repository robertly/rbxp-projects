local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local productId = 0000000 -- Change this to your developer product ID

-- Function to prompt purchase of the developer product
local function promptPurchase()
	MarketplaceService:PromptProductPurchase(player, productId)
end

promptPurchase()

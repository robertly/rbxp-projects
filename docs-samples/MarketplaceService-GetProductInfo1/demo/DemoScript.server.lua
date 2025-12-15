local MarketplaceService = game:GetService("MarketplaceService")

local ASSET_ID = 125378389

local asset = MarketplaceService:GetProductInfo(ASSET_ID)
print(asset.Name .. " :: " .. asset.Description)

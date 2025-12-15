local AvatarEditorService = game:GetService("AvatarEditorService")

local assets = AvatarEditorService:GetRecommendedAssets(Enum.AvatarAssetType.Hat, 9255093)

for _, asset in ipairs(assets) do
	print(asset.Item.Name)
end

local ContentProvider = game:GetService("ContentProvider")

-- An example asset to load
local ASSET_ID = "rbxassetid://9120386436"
local exampleAsset = Instance.new("Sound")
exampleAsset.SoundId = ASSET_ID

-- Output the current AssetFetchStatus of the asset
local initialAssetFetchStatus = ContentProvider:GetAssetFetchStatus(ASSET_ID)
print("Initial AssetFetchStatus:", initialAssetFetchStatus)

-- Listen for updates
local assetFetchStatusChangedSignal = ContentProvider:GetAssetFetchStatusChangedSignal(ASSET_ID)
local function onAssetFetchStatusChanged(newAssetFetchStatus: Enum.AssetFetchStatus)
	print(`New AssetFetchStatus: {newAssetFetchStatus}`)
end
assetFetchStatusChangedSignal:Connect(onAssetFetchStatusChanged)

-- Trigger the asset to preload
local function onAssetRequestComplete(contentId: string, assetFetchStatus: Enum.AssetFetchStatus)
	print(`Preload status {contentId}: {assetFetchStatus.Name}`)
end
ContentProvider:PreloadAsync({ exampleAsset }, onAssetRequestComplete)

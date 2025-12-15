local ContentProvider = game:GetService("ContentProvider")

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
local decal = Instance.new("Decal")
decal.Texture = "rbxassetid://5447528495"

local assets = {
	decal,
	sound,
	"rbxassetid://5173222739",
	"rbxthumb://type=Avatar&w=100&h=100&id=269323",
}

-- This will be hit as each asset resolves
local callback = function(assetId, assetFetchStatus)
	print("PreloadAsync() resolved asset ID:", assetId)
	print("PreloadAsync() final AssetFetchStatus:", assetFetchStatus)
end

-- Preload the content and time it
local startTime = os.clock()
ContentProvider:PreloadAsync(assets, callback)
local deltaTime = os.clock() - startTime
print(("Preloading complete, took %.2f seconds"):format(deltaTime))

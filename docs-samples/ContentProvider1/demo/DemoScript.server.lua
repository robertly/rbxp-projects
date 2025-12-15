local ContentProvider = game:GetService("ContentProvider")

local LOGO_ID = "rbxassetid://658743164"
local PAGE_TURN_ID = "rbxassetid://12222076"

local decal = Instance.new("Decal")
decal.Texture = LOGO_ID

local sound = Instance.new("Sound")
sound.SoundId = PAGE_TURN_ID

local assets = { decal, sound }

ContentProvider:PreloadAsync(assets)

print("All assets loaded.")

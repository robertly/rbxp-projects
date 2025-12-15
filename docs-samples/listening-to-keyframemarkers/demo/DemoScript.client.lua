local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.Character:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Create new "Animation" instance
local kickAnimation = Instance.new("Animation")
-- Set its "AnimationId" to the corresponding animation asset ID
kickAnimation.AnimationId = "rbxassetid://2515090838"

-- Load animation onto the humanoid
local kickAnimationTrack = humanoid:LoadAnimation(kickAnimation)

-- Play animation track
kickAnimationTrack:Play()

-- If a named event was defined for the animation, connect it to "GetMarkerReachedSignal()"
kickAnimationTrack:GetMarkerReachedSignal("KickEnd"):Connect(function(paramString)
	print(paramString)
end)

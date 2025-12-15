local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer
while not localPlayer.Character do
	task.wait()
end
local character = localPlayer.Character
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507770453"

ContentProvider:PreloadAsync({ animation })

local animationTrack = animator:LoadAnimation(animation)

local normalSpeedTime = animationTrack.Length / animationTrack.Speed
animationTrack:AdjustSpeed(3)
local fastSpeedTime = animationTrack.Length / animationTrack.Speed

print("At normal speed the animation will play for", normalSpeedTime, "seconds")
print("At 3x speed the animation will play for", fastSpeedTime, "seconds")

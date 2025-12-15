local function playAnimationForDuration(animationTrack, duration)
	local speed = animationTrack.Length / duration
	animationTrack:Play()
	animationTrack:AdjustSpeed(speed)
end

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507765000"

local humanoid = script.Parent:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

local animationTrack = animator:LoadAnimation(animation)

playAnimationForDuration(animationTrack, 3)

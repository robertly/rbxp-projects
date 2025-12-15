local function yieldPlayAnimation(animationTrack, fadeTime, weight, speed)
	animationTrack:Play(fadeTime, weight, speed)
	animationTrack.Stopped:Wait()
	print("Animation has stopped")
end

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507765644"

local humanoid = script.Parent:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local animationTrack = animator:LoadAnimation(animation)

yieldPlayAnimation(animationTrack, 1, 0.6, 1)

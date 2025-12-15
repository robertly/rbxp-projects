local function playOrAdjust(animationTrack, fadeTime, weight, speed)
	if not animationTrack.IsPlaying then
		animationTrack:Play(fadeTime, weight, speed)
	else
		animationTrack:AdjustSpeed(speed)
		animationTrack:AdjustWeight(weight, fadeTime)
	end
end

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507765644"

local humanoid = script.Parent:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local animationTrack = animator:LoadAnimation(animation)

playOrAdjust(animationTrack, 1, 0.6, 1)

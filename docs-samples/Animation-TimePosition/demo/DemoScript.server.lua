function freezeAnimationAtTime(animationTrack, timePosition)
	if not animationTrack.IsPlaying then
		-- Play the animation if it is not playing
		animationTrack:Play()
	end
	-- Set the speed to 0 to freeze the animation
	animationTrack:AdjustSpeed(0)
	-- Jump to the desired TimePosition
	animationTrack.TimePosition = timePosition
end

function freezeAnimationAtPercent(animationTrack, percentagePosition)
	if not animationTrack.IsPlaying then
		-- Play the animation if it is not playing
		animationTrack:Play()
	end
	-- Set the speed to 0 to freeze the animation
	animationTrack:AdjustSpeed(0)
	-- Jump to the desired TimePosition
	animationTrack.TimePosition = (percentagePosition / 100) * animationTrack.Length
end

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507765644"

local humanoid = script.Parent:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local animationTrack = animator:LoadAnimation(animation)

freezeAnimationAtTime(animationTrack, 0.5)
freezeAnimationAtPercent(animationTrack, 50)

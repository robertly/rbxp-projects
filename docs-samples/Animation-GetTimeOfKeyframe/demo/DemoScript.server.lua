local function jumpToKeyframe(animationTrack, keyframeName)
	local timePosition = animationTrack:GetTimeOfKeyframe(keyframeName)
	if not animationTrack.IsPlaying then
		animationTrack:Play()
	end
	animationTrack.TimePosition = timePosition
end

local ANIMATION_ID = 0
local KEYFRAME_NAME = "Test"

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://" .. ANIMATION_ID

local humanoid = script.Parent:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local animationTrack = animator:LoadAnimation(animation)

jumpToKeyframe(animationTrack, KEYFRAME_NAME)

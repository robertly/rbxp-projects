local KeyframeSequenceProvider = game:GetService("KeyframeSequenceProvider")

local function createPreviewAnimation(keyframeSequence)
	local hashId = KeyframeSequenceProvider:RegisterKeyframeSequence(keyframeSequence)
	local Animation = Instance.new("Animation")
	Animation.AnimationId = hashId
	return Animation
end

local keyframeSequence = Instance.new("KeyframeSequence")

local animation = createPreviewAnimation(keyframeSequence)

print(animation)

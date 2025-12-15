local function getSequenceLength(keyframeSequence)
	local length = 0
	for _, keyframe in pairs(keyframeSequence:GetKeyframes()) do
		if keyframe.Time > length then
			length = keyframe.Time
		end
	end
	return length
end

local keyframeSequence = Instance.new("KeyframeSequence")

getSequenceLength(keyframeSequence)

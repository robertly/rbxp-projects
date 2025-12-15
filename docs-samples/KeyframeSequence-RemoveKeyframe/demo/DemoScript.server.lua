local keyframeSequence = Instance.new("KeyframeSequence")
keyframeSequence.Parent = workspace

local keyframe = Instance.new("Keyframe")

keyframeSequence:AddKeyframe(keyframe)

task.wait(2)

keyframeSequence:AddKeyframe(keyframe)

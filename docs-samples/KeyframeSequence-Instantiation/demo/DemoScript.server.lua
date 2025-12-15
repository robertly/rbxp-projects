-- create the keyframesequence
local keyframeSequence = Instance.new("KeyframeSequence")
keyframeSequence.Loop = false
keyframeSequence.Priority = Enum.AnimationPriority.Action

--  create a keyframe
local keyframe = Instance.new("Keyframe")
keyframe.Time = 0

-- create sample poses
local rootPose = Instance.new("Pose")
rootPose.Name = "HumanoidRootPart"
rootPose.Weight = 0

local lowerTorsoPose = Instance.new("Pose")
lowerTorsoPose.Name = "LowerTorso"
lowerTorsoPose.Weight = 1

-- set the sequence hierarchy
rootPose:AddSubPose(lowerTorsoPose) -- lowerTorsoPose.Parent = rootPose
keyframe:AddPose(rootPose) -- rootPose.Parent = keyframe
keyframeSequence:AddKeyframe(keyframe) -- keyframe.Parent = keyframeSequence

-- parent the sequence
keyframeSequence.Parent = workspace

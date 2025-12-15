local keyframe = Instance.new("Keyframe")
keyframe.Parent = workspace

local pose = Instance.new("Pose")
pose.EasingStyle = Enum.PoseEasingStyle.Cubic
pose.EasingDirection = Enum.PoseEasingDirection.Out

local pose2 = Instance.new("Pose")
pose2.EasingStyle = Enum.PoseEasingStyle.Cubic
pose2.EasingDirection = Enum.PoseEasingDirection.Out

keyframe:AddPose(pose) -- pose.Parent = keyframe

task.wait(2)

keyframe:RemovePose(pose) -- pose.Parent = nil

task.wait(2)

keyframe:AddPose(pose) -- pose.Parent = keyframe

task.wait(2)

pose:AddSubPose(pose2) -- pose2.Parent = pose

task.wait(2)

pose:RemoveSubPose(pose2) -- pose2.Parent = nil

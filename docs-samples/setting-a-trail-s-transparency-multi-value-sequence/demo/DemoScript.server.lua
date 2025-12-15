local TweenService = game:GetService("TweenService")

local part = Instance.new("Part")
part.Anchored = true
part.Position = Vector3.new(0, 5, 0)
part.Parent = workspace

local attachment0 = Instance.new("Attachment")
attachment0.Name = "Attachment0"
attachment0.Position = Vector3.new(-2, 0, 0)
attachment0.Parent = part

local attachment1 = Instance.new("Attachment")
attachment1.Name = "Attachment1"
attachment1.Position = Vector3.new(2, 0, 0)
attachment1.Parent = part

local trail = Instance.new("Trail")
trail.Attachment0 = attachment0
trail.Attachment1 = attachment1
trail.Parent = part

local keypoints = {}
table.insert(keypoints, NumberSequenceKeypoint.new(0, 1))
table.insert(keypoints, NumberSequenceKeypoint.new(0.25, 0))
table.insert(keypoints, NumberSequenceKeypoint.new(1, 1))
local multiValueSequence = NumberSequence.new(keypoints)
trail.Transparency = multiValueSequence

local dir = 15
while true do
	dir = dir * -1
	local goal = {}
	goal.Position = part.Position + Vector3.new(0, 0, dir)

	local tweenInfo = TweenInfo.new(5)
	local tween = TweenService:Create(part, tweenInfo, goal)
	tween:Play()

	task.wait(5)
end

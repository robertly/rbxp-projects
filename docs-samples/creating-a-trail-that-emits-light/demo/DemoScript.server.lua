local part = Instance.new("Part")
part.Parent = workspace
part.Anchored = true
part.Position = Vector3.new(0, 5, 0)

local attachment0 = Instance.new("Attachment")
attachment0.Name = "Attachment0"
attachment0.Parent = part
attachment0.Position = Vector3.new(-2, 0, 0)

local attachment1 = Instance.new("Attachment")
attachment1.Name = "Attachment1"
attachment1.Parent = part
attachment1.Position = Vector3.new(2, 0, 0)

local trail = Instance.new("Trail")
trail.Parent = part
trail.Attachment0 = attachment0
trail.Attachment1 = attachment1
trail.LightEmission = 1

-- Tween part to display trail
local TweenService = game:GetService("TweenService")

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

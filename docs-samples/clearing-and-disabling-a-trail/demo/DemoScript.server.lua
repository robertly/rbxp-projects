-- The function that tweens the part back and forth 15 studs
local DISTANCE = 15
local TweenService = game:GetService("TweenService")

local function tweenPart(part)
	DISTANCE *= -1
	local goal = {}
	goal.Position = part.Position + Vector3.new(0, 0, DISTANCE)

	local tweenInfo = TweenInfo.new(5)
	local tween = TweenService:Create(part, tweenInfo, goal)
	tween:Play()

	task.wait(5)
end

-- Create a new BasePart
local part = Instance.new("Part")
part.Parent = game.Workspace
part.Anchored = true
part.Position = Vector3.new(0, 5, 0)

-- Create 2 attachments
local attachment0 = Instance.new("Attachment")
attachment0.Name = "Attachment0"
attachment0.Parent = part
attachment0.Position = Vector3.new(-2, 0, 0)

local attachment1 = Instance.new("Attachment")
attachment1.Name = "Attachment1"
attachment1.Parent = part
attachment1.Position = Vector3.new(2, 0, 0)

-- Create a new Trail
local trail = Instance.new("Trail")
trail.Parent = part
trail.Attachment0 = attachment0
trail.Attachment1 = attachment1
local color1 = Color3.fromRGB(15, 127, 254)
local color2 = Color3.fromRGB(255, 255, 255)
trail.Color = ColorSequence.new(color1, color2)

-- Tween part, clear trail segments, and toggle trail between enabled/disabled
while true do
	tweenPart(part)
	trail:Clear()
	trail.Enabled = not trail.Enabled
end

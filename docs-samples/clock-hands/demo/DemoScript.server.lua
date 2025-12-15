local function createHand(length, width, yOffset)
	local part = Instance.new("Part")
	part.Size = Vector3.new(width, 0.1, length)
	part.Material = Enum.Material.Neon
	part.PivotOffset = CFrame.new(0, -(yOffset + 0.1), length / 2)
	part.Anchored = true
	part.Parent = workspace
	return part
end

local function positionHand(hand, fraction)
	hand:PivotTo(CFrame.fromEulerAnglesXYZ(0, -fraction * 2 * math.pi, 0))
end

-- Create dial
for i = 0, 11 do
	local dialPart = Instance.new("Part")
	dialPart.Size = Vector3.new(0.2, 0.2, 1)
	dialPart.TopSurface = Enum.SurfaceType.Smooth
	if i == 0 then
		dialPart.Size = Vector3.new(0.2, 0.2, 2)
		dialPart.Color = Color3.new(1, 0, 0)
	end
	dialPart.PivotOffset = CFrame.new(0, -0.1, 10.5)
	dialPart.Anchored = true
	dialPart:PivotTo(CFrame.fromEulerAnglesXYZ(0, (i / 12) * 2 * math.pi, 0))
	dialPart.Parent = workspace
end

-- Create hands
local hourHand = createHand(7, 1, 0)
local minuteHand = createHand(10, 0.6, 0.1)
local secondHand = createHand(11, 0.2, 0.2)

-- Run clock
while true do
	local components = os.date("*t")
	positionHand(hourHand, (components.hour + components.min / 60) / 12)
	positionHand(minuteHand, (components.min + components.sec / 60) / 60)
	positionHand(secondHand, components.sec / 60)
	task.wait()
end

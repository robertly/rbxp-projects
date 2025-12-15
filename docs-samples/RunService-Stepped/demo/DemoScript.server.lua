local RunService = game:GetService("RunService")

local PART_START_POS = Vector3.new(0, 10, 0)
local PART_SPEED = Vector3.new(10, 0, 0)

-- Create a Part with a BodyPosition
local part = Instance.new("Part")
part.CFrame = CFrame.new(PART_START_POS)

local bp = Instance.new("BodyPosition")
bp.Parent = part
bp.Position = PART_START_POS
part.Parent = workspace

local function onStep(_currentTime, deltaTime)
	-- Move the part the distance it is meant to move
	-- in the last `deltaTime` seconds
	bp.Position = bp.Position + PART_SPEED * deltaTime

	-- Here's the math behind this:
	-- speed = displacement / time
	-- displacement = speed * time
end

RunService.Stepped:Connect(onStep)

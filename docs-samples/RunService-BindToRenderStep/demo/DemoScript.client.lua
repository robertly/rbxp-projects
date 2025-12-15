local RunService = game:GetService("RunService")

-- How fast the frame ought to move
local SPEED = 2

local frame = script.Parent
frame.AnchorPoint = Vector2.new(0.5, 0.5)

-- A simple parametric equation of a circle
-- centered at (0.5, 0.5) with radius (0.5)
local function circle(t)
	return 0.5 + math.cos(t) * 0.5, 0.5 + math.sin(t) * 0.5
end

-- Keep track of the current time
local currentTime = 0
local function onRenderStep(deltaTime)
	-- Update the current time
	currentTime = currentTime + deltaTime * SPEED
	-- ...and the frame's position
	local x, y = circle(currentTime)
	frame.Position = UDim2.new(x, 0, y, 0)
end

-- This is just a visual effect, so use the "Last" priority
RunService:BindToRenderStep("FrameCircle", Enum.RenderPriority.Last.Value, onRenderStep)
--RunService.RenderStepped:Connect(onRenderStep) -- Also works, but not recommended

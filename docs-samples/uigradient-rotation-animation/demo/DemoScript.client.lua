local RunService = game:GetService("RunService")

local ROTATE_SPEED = 90 -- degrees per second

local uiGradient = script.Parent

local function onRenderStep(deltaTime)
	local currentRotation = uiGradient.Rotation
	uiGradient.Rotation = (currentRotation + ROTATE_SPEED * deltaTime) % 360
end

RunService.RenderStepped:Connect(onRenderStep)

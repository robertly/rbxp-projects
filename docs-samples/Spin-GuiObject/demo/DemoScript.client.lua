local RunService = game:GetService("RunService")

local guiObject = script.Parent

local degreesPerSecond = 180

local function onRenderStep(deltaTime)
	local deltaRotation = deltaTime * degreesPerSecond
	guiObject.Rotation = guiObject.Rotation + deltaRotation
end

RunService.RenderStepped:Connect(onRenderStep)

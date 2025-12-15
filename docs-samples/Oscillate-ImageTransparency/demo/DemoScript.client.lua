local RunService = game:GetService("RunService")

local imageLabel = script.Parent

local function onRenderStep()
	-- Oscillate ImageTransparency from 0 to 1 using a sine wave
	imageLabel.ImageTransparency = math.sin(workspace.DistributedGameTime * math.pi) * 0.5 + 0.5
end

RunService.RenderStepped:Connect(onRenderStep)

local RunService = game:GetService("RunService")

local imageLabel = script.Parent

local function onRenderStep()
	imageLabel.ImageColor3 = Color3.fromHSV(workspace.DistributedGameTime / 8 % 1, 1, 1)
end

RunService.RenderStepped:Connect(onRenderStep)

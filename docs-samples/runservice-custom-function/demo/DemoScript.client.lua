local RunService = game:GetService("RunService")

local function checkDelta(deltaTime)
	print("Time since last render step:", deltaTime)
end

RunService:BindToRenderStep("Check delta", Enum.RenderPriority.First.Value, checkDelta)

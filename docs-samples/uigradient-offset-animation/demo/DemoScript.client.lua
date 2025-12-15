local RunService = game:GetService("RunService")

local OFFSET_SPEED_X = 1 -- units per second

local uiGradient = script.Parent

local function onRenderStep(deltaTime)
	local currentOffsetX = uiGradient.Offset.X
	if currentOffsetX < -1 then
		uiGradient.Offset = Vector2.new(1, 0)
	else
		uiGradient.Offset = Vector2.new(currentOffsetX - OFFSET_SPEED_X * deltaTime, 0)
	end
end

RunService.RenderStepped:Connect(onRenderStep)

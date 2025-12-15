local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local function OnRenderStep()
	local delta = UserInputService:GetMouseDelta()
	print("The mouse has moved", delta, "since the last step.")
end

RunService:BindToRenderStep("MeasureMouseMovement", Enum.RenderPriority.Input.Value, OnRenderStep)

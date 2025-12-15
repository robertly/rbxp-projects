local RunService = game:GetService("RunService")

local function onStepped()
	print("Stepped")
end

RunService.Stepped:Connect(onStepped)

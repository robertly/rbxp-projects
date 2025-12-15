local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local ball = script.Parent:WaitForChild("Ball")
local mass = ball:GetMass()
local gravityForce = ball:WaitForChild("GravityForce")

local function moveBall(gravity)
	gravityForce.Force = gravity.Position * Workspace.Gravity * mass
end

if UserInputService.AccelerometerEnabled then
	UserInputService.DeviceGravityChanged:Connect(moveBall)
end

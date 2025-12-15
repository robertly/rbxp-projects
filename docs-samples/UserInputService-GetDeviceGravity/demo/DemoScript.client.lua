local UserInputService = game:GetService("UserInputService")

local bubble = script.Parent:WaitForChild("Bubble")
local camera = workspace.CurrentCamera

camera.CameraType = Enum.CameraType.Scriptable
camera.CFrame = CFrame.new(0, 20, 0) * CFrame.Angles(-math.pi / 2, 0, 0)

if UserInputService.GyroscopeEnabled then
	-- Bind event to when gyroscope detects change
	UserInputService.DeviceGravityChanged:Connect(function(accel)
		-- Move the bubble in the world based on the gyroscope data
		bubble.Position = Vector3.new(-8 * accel.Position.X, 1.8, -8 * accel.Position.Z)
	end)
end

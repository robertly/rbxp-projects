local UserInputService = game:GetService("UserInputService")

local accelerometerEnabled = UserInputService.AccelerometerEnabled

if accelerometerEnabled then
	local acceleration = UserInputService:GetDeviceAcceleration().Position
	print(acceleration)
else
	print("Cannot get device acceleration because device does not have an enabled accelerometer!")
end

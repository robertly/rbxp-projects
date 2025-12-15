local UserInputService = game:GetService("UserInputService")

local gyroEnabled = UserInputService:GyroscopeEnabled()

if gyroEnabled then
	local _inputObj, cframe = UserInputService:GetDeviceRotation()
	print("CFrame: {", cframe, "}")
else
	print("Cannot get device rotation because device does not have an enabled gyroscope!")
end

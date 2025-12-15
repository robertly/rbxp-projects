local UserInputService = game:GetService("UserInputService")

local isConnected = UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1)

if isConnected then
	print("Gamepad1 is connected to the client")
else
	print("Gamepad1 is not connected to the client")
end

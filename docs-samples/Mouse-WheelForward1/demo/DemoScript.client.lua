local Players = game:GetService("Players")

local player = Players.LocalPlayer

local mouse = player:GetMouse()

local function onWheelBackward()
	print("Wheel went forward!")
end

mouse.WheelForward:Connect(onWheelBackward)

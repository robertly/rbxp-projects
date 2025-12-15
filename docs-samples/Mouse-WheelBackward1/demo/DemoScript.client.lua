local Players = game:GetService("Players")

local player = Players.LocalPlayer

local mouse = player:GetMouse()

local function onWheelBackward()
	print("Wheel went backwards!")
end

mouse.WheelBackward:Connect(onWheelBackward)

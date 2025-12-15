local Players = game:GetService("Players")

local player = Players.LocalPlayer

local mouse = player:GetMouse()

local function onMouseMove()
	print("mouse screen position: ", mouse.X, mouse.Y)
end

mouse.Move:Connect(onMouseMove)

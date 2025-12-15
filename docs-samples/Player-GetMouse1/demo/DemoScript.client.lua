local Players = game:GetService("Players")

local player = Players.LocalPlayer

local mouse = player:GetMouse()

local function onButton1Down()
	print("Button 1 is down")
end

mouse.Button1Down:Connect(onButton1Down)

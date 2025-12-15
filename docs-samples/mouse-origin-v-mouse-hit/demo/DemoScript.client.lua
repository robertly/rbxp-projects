local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local mouse = player:GetMouse()
local camPos = camera.CFrame.Position

local function onButton1Down()
	print("Mouse.Hit:", mouse.Hit.Position)
	print("camPos:", camPos)
	print("Mouse.Origin:", mouse.Origin.Position)
	print("Magnitude:", (mouse.Origin.Position - camPos).Magnitude)
end

mouse.Button1Down:Connect(onButton1Down)

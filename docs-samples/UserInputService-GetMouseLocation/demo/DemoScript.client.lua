local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local gui = script.Parent
local screenGui = gui.Parent
screenGui.IgnoreGuiInset = true

local function moveGuiToMouse()
	local mouseLocation = UserInputService:GetMouseLocation()
	gui.Position = UDim2.fromOffset(mouseLocation.X, mouseLocation.Y)
end

moveGuiToMouse()
RunService:BindToRenderStep("moveGuiToMouse", 1, moveGuiToMouse)

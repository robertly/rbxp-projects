local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local viewportFrame = Instance.new("ViewportFrame")
viewportFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
viewportFrame.Position = UDim2.new(0, 15, 0, 15)
viewportFrame.BackgroundColor3 = Color3.new(0, 0, 0)
viewportFrame.BorderColor3 = Color3.new(0.6, 0.5, 0.4)
viewportFrame.BorderSizePixel = 2
viewportFrame.BackgroundTransparency = 0.25
viewportFrame.Parent = screenGui

local part = Instance.new("Part")
part.Material = Enum.Material.Concrete
part.Color = Color3.new(0.25, 0.75, 1)
part.Position = Vector3.new(0, 0, 0)
part.Parent = viewportFrame

local viewportCamera = Instance.new("Camera")
viewportFrame.CurrentCamera = viewportCamera
viewportCamera.Parent = viewportFrame

viewportCamera.CFrame = CFrame.new(Vector3.new(0, 2, 12), part.Position)

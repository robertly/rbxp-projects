local Players = game:GetService("Players")

local player = Players.LocalPlayer

local tool = Instance.new("Tool")
tool.Name = "Stick"
tool.Parent = player.Backpack

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Parent = tool
handle.Size = Vector3.new(0.1, 3, 0.1)
handle.Color = Color3.fromRGB(108, 88, 75) -- Brown

tool.Activated:Connect(function()
	print(tool.Grip)
	print(tool.GripUp)
	print(tool.GripRight)
	print(tool.GripForward)
	print(tool.GripPos)
end)

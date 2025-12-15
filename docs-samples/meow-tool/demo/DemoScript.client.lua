local Players = game:GetService("Players")

local player = Players.LocalPlayer

local backpack = player:WaitForChild("Backpack")

local tool = Instance.new("Tool")
tool.Name = "I AM CAT"
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Parent = backpack

local function onToolActivated()
	print("Meow")
end

tool.Activated:Connect(onToolActivated)

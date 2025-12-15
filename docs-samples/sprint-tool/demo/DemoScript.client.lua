local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local tool = Instance.new("Tool")
tool.Name = "Sprint"
tool.RequiresHandle = false
tool.Parent = player:WaitForChild("Backpack")

function toolActivated()
	humanoid.WalkSpeed = 30
	tool.ManualActivationOnly = true
	task.wait(5)
	tool.ManualActivationOnly = false
	humanoid.WalkSpeed = 16
end

tool.Activated:Connect(toolActivated)
tool.Unequipped:Connect(function()
	humanoid.WalkSpeed = 16
end)

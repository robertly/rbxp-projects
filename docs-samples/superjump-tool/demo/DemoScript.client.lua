local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local tool = Instance.new("Tool")
tool.Name = "SuperJump"
tool.RequiresHandle = false
tool.Parent = player.Backpack

function toolActivated()
	humanoid.JumpPower = 150
	tool.Enabled = false
	task.wait(5)
	tool.Enabled = true
	humanoid.JumpPower = 50
end

tool.Activated:Connect(toolActivated)
tool.Unequipped:Connect(function()
	humanoid.JumpPower = 50
end)

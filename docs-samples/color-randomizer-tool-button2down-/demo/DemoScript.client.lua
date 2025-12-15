local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer

local backpack = localPlayer:WaitForChild("Backpack")

local tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Parent = backpack

tool.Equipped:Connect(function(mouse)
	mouse.Button2Down:Connect(function()
		if mouse.Target and mouse.Target.Parent then
			mouse.Target.BrickColor = BrickColor.random()
		end
	end)
end)

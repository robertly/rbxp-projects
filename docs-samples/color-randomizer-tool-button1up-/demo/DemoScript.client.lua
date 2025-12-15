local Players = game:GetService("Players")

local mouse = Players.LocalPlayer:GetMouse()
local target = nil

mouse.Button2Down:Connect(function()
	target = mouse.Target
end)

mouse.Button2Up:Connect(function()
	if target == mouse.Target then
		target.BrickColor = BrickColor.random()
	end
end)

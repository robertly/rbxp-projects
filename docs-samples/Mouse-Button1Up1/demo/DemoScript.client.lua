local Players = game:GetService("Players")

local player = Players.LocalPlayer

local mouse = player:GetMouse()
local target = nil

local function button1Down()
	target = mouse.Target
end

local function button1Up()
	if target == mouse.Target then
		target.BrickColor = BrickColor.random()
	end
end

mouse.Button1Down:Connect(button1Down)
mouse.Button1Up:Connect(button1Up)

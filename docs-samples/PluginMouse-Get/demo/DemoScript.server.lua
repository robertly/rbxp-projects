plugin:Activate(false) -- gain non exclusive access to the mouse
local mouse = plugin:GetMouse()

local function button1Down()
	print("Left mouse click")
end

mouse.Button1Down:Connect(button1Down)

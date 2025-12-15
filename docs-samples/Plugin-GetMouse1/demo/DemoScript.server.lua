local mouse = plugin:GetMouse()

local function button1Down()
	print("Button 1 pressed from PluginMouse")
end

mouse.Button1Down:Connect(button1Down)

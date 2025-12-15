local button = script.Parent.Button

local function rightClick()
	print("Right click pressed down and up on button.")
end

button.MouseButton2Click:Connect(rightClick)

local button = script.Parent

local function leftClick()
	print("Left mouse click")
end

local function rightClick()
	print("Right mouse click")
end

button.MouseButton1Click:Connect(leftClick)
button.MouseButton2Click:Connect(rightClick)

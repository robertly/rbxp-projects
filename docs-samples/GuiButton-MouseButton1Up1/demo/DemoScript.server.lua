local button = script.Parent

local function leftMouseButtonUp(x, y)
	print("Left mouse up at", x, y)
end

local function leftMouseButtonDown(x, y)
	print("Left mouse down at", x, y)
end

button.MouseButton1Up:Connect(leftMouseButtonUp)
button.MouseButton1Down:Connect(leftMouseButtonDown)

local gui = script.Parent
local button = gui.Button

function rightMouseButtonUp(x, y)
	print("Right mouse up", x, y)
end

function rightMouseButtonDown(x, y)
	print("Right mouse down", x, y)
end

button.MouseButton2Up:Connect(rightMouseButtonUp)
button.MouseButton2Down:Connect(rightMouseButtonDown)

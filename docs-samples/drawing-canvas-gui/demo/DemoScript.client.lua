local UserInputService = game:GetService("UserInputService")

local canvas = script.Parent
local clearButton = script.Parent.Parent:FindFirstChild("ClearButton")
local pointer = canvas:FindFirstChild("Pointer")

local isMouseButtonDown = false

function paint(X, Y)
	local gui_X = canvas.AbsolutePosition.X
	local gui_Y = canvas.AbsolutePosition.Y

	local offset = Vector2.new(math.abs(X - gui_X), math.abs(Y - gui_Y - 36))
	pointer.Position = UDim2.new(0, offset.X, 0, offset.Y)

	if isMouseButtonDown == false then
		return
	end

	local pixel = pointer:Clone()
	pixel.Name = "Pixel"
	pixel.Parent = canvas
end

function clear()
	local children = canvas:GetChildren()

	for _, child in pairs(children) do
		if child.Name == "Pixel" then
			child:Destroy()
		end
	end
end

function showPointer()
	pointer.Visible = true
end

function hidePointer()
	pointer.Visible = false
end

function inputBegan(input)
	local inputType = input.UserInputType
	if inputType == Enum.UserInputType.MouseButton1 then
		isMouseButtonDown = true
	end
end

function inputEnded(input)
	local inputType = input.UserInputType
	if inputType == Enum.UserInputType.MouseButton1 then
		isMouseButtonDown = false
	end
end

clearButton.MouseButton1Click:Connect(clear)

UserInputService.InputBegan:Connect(inputBegan)
UserInputService.InputEnded:Connect(inputEnded)

canvas.MouseMoved:Connect(paint)
canvas.MouseEnter:Connect(showPointer)
canvas.MouseLeave:Connect(hidePointer)

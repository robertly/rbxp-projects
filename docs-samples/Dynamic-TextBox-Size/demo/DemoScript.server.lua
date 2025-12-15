local textBox = script.Parent

-- The smallest the TextBox will go
local minWidth, minHeight = 10, 10

-- Set alignment so our text doesn't wobble a bit while we type
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.TextYAlignment = Enum.TextYAlignment.Top

local function updateSize()
	textBox.Size = UDim2.new(0, math.max(minWidth, textBox.TextBounds.X), 0, math.max(minHeight, textBox.TextBounds.Y))
end

textBox:GetPropertyChangedSignal("TextBounds"):Connect(updateSize)

local frame = script.Parent
frame.Active = true

local dragging = false
local basePosition
local startTouchPosition
local borderColor3
local backgroundColor3

local function onTouchLongPress(touchPositions, state)
	if state == Enum.UserInputState.Begin and not dragging then
		-- Start a drag
		dragging = true
		basePosition = frame.Position
		startTouchPosition = touchPositions[1]
		-- Color the frame to indicate the drag is happening
		borderColor3 = frame.BorderColor3
		backgroundColor3 = frame.BackgroundColor3
		frame.BorderColor3 = Color3.new(1, 1, 1) -- White
		frame.BackgroundColor3 = Color3.new(0, 0, 1) -- Blue
	elseif state == Enum.UserInputState.Change then
		local touchPosition = touchPositions[1]
		local deltaPosition =
			UDim2.new(0, touchPosition.X - startTouchPosition.X, 0, touchPosition.Y - startTouchPosition.Y)
		frame.Position = basePosition + deltaPosition
	elseif state == Enum.UserInputState.End and dragging then
		-- Stop the drag
		dragging = false
		frame.BorderColor3 = borderColor3
		frame.BackgroundColor3 = backgroundColor3
	end
end

frame.TouchLongPress:Connect(onTouchLongPress)

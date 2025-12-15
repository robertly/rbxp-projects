local innerFrame = script.Parent
local outerFrame = innerFrame.Parent
outerFrame.BackgroundTransparency = 0.75
outerFrame.Active = true
outerFrame.Size = UDim2.new(1, 0, 1, 0)
outerFrame.Position = UDim2.new(0, 0, 0, 0)
outerFrame.AnchorPoint = Vector2.new(0, 0)
outerFrame.ClipsDescendants = true

local dragging = false
local baseRotation = innerFrame.Rotation

local function onTouchRotate(_touchPositions, rotation, _velocity, state)
	if state == Enum.UserInputState.Begin and not dragging then
		dragging = true
		baseRotation = innerFrame.Rotation
		outerFrame.BackgroundTransparency = 0.25
	elseif state == Enum.UserInputState.Change then
		innerFrame.Rotation = baseRotation + rotation
	elseif state == Enum.UserInputState.End and dragging then
		dragging = false
		outerFrame.BackgroundTransparency = 0.75
	end
end

outerFrame.TouchRotate:Connect(onTouchRotate)

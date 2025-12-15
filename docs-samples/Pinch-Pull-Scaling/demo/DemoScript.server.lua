local innerFrame = script.Parent
local outerFrame = innerFrame.Parent
outerFrame.BackgroundTransparency = 0.75
outerFrame.Active = true
outerFrame.Size = UDim2.new(1, 0, 1, 0)
outerFrame.Position = UDim2.new(0, 0, 0, 0)
outerFrame.AnchorPoint = Vector2.new(0, 0)
outerFrame.ClipsDescendants = true

local dragging = false
local uiScale = Instance.new("UIScale")
uiScale.Parent = innerFrame
local baseScale

local function onTouchPinch(_touchPositions, scale, _velocity, state)
	if state == Enum.UserInputState.Begin and not dragging then
		dragging = true
		baseScale = uiScale.Scale
		outerFrame.BackgroundTransparency = 0.25
	elseif state == Enum.UserInputState.Change then
		uiScale.Scale = baseScale * scale -- Notice the multiplication here
	elseif state == Enum.UserInputState.End and dragging then
		dragging = false
		outerFrame.BackgroundTransparency = 0.75
	end
end

outerFrame.TouchPinch:Connect(onTouchPinch)

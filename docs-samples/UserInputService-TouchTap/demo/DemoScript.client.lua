local UserInputService = game:GetService("UserInputService")

-- The parent of this script (a ScreenGui)
local touchScreenGui = script.Parent

-- Create the GUI frame that the user interacts with through Touch
-- events
local touchGui = Instance.new("Frame")
touchGui.Name = "TouchGui"
touchGui.AnchorPoint = Vector2.new(0.5, 0.5)

-- Fires when the touches their device's screen
local function TouchTap(touchPositions, _gameProcessedEvent)
	touchGui.Parent = touchScreenGui
	touchGui.Position = UDim2.new(0, touchPositions[1].X, 0, touchPositions[1].Y)
	touchGui.Size = UDim2.new(0, 50, 0, 50)
end

-- Fires when a user starts touching their device's screen and does not
-- move their finger for a short period of time
local function TouchLong(_touchPositions, _state, _gameProcessedEvent)
	touchGui.Size = UDim2.new(0, 100, 0, 100)
end

-- Fires when the user moves their finger while touching their device's
-- screen
local function TouchMove(touch, _gameProcessedEvent)
	touchGui.Position = UDim2.new(0, touch.Position.X, 0, touch.Position.Y)
end

-- Fires when the user stops touching their device's screen
local function TouchEnd(_touch, _gameProcessedEvent)
	touchGui.Parent = nil
	touchGui.Size = UDim2.new(0, 50, 0, 50)
end

-- Only use the Touch events if the user is on a mobile device
if UserInputService.TouchEnabled then
	UserInputService.TouchTap:Connect(TouchTap)
	UserInputService.TouchLongPress:Connect(TouchLong)
	UserInputService.TouchMoved:Connect(TouchMove)
	UserInputService.TouchEnded:Connect(TouchEnd)
end

local frame = script.Parent
frame.Active = true

-- How far the frame should bounce on a successful swipe
local BOUNCE_DISTANCE = 50

-- Current state of the frame
local basePosition = frame.Position
local hue = 0
local saturation = 128

local function updateColor()
	frame.BackgroundColor3 = Color3.fromHSV(hue / 256, saturation / 256, 1)
end

local function onTouchSwipe(swipeDir, _touchCount)
	-- Change the BackgroundColor3 based on the swipe direction
	local deltaPos
	if swipeDir == Enum.SwipeDirection.Right then
		deltaPos = UDim2.new(0, BOUNCE_DISTANCE, 0, 0)
		hue = (hue + 16) % 255
	elseif swipeDir == Enum.SwipeDirection.Left then
		deltaPos = UDim2.new(0, -BOUNCE_DISTANCE, 0, 0)
		hue = (hue - 16) % 255
	elseif swipeDir == Enum.SwipeDirection.Up then
		deltaPos = UDim2.new(0, 0, 0, -BOUNCE_DISTANCE)
		saturation = (saturation + 16) % 255
	elseif swipeDir == Enum.SwipeDirection.Down then
		deltaPos = UDim2.new(0, 0, 0, BOUNCE_DISTANCE)
		saturation = (saturation - 16) % 255
	else
		deltaPos = UDim2.new()
	end
	-- Update the color and bounce the frame a little
	updateColor()
	frame.Position = basePosition + deltaPos
	frame:TweenPosition(basePosition, Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.7, true)
end

frame.TouchSwipe:Connect(onTouchSwipe)
updateColor()

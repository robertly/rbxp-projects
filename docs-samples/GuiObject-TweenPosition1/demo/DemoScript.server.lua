local START_POSITION = UDim2.new(0, 0, 0, 0)
local GOAL_POSITION = UDim2.new(1, 0, 1, 0)

local guiObject = script.Parent

local function callback(state)
	if state == Enum.TweenStatus.Completed then
		print("The tween completed uninterrupted")
	elseif state == Enum.TweenStatus.Canceled then
		print("Another tween cancelled this one")
	end
end

-- Initialize the GuiObject position, then start the tween:
guiObject.Position = START_POSITION

local willPlay = guiObject:TweenPosition(
	GOAL_POSITION, -- Final position the tween should reach
	Enum.EasingDirection.In, -- Direction of the easing
	Enum.EasingStyle.Sine, -- Kind of easing to apply
	2, -- Duration of the tween in seconds
	true, -- Whether in-progress tweens are interrupted
	callback -- Function to be callled when on completion/cancelation
)

if willPlay then
	print("The tween will play")
else
	print("The tween will not play")
end

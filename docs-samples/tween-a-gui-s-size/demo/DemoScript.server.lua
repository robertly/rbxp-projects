local guiObject = script.Parent

local function callback(didComplete)
	if didComplete then
		print("The tween completed successfully")
	else
		print("The tween was cancelled")
	end
end

local willTween = guiObject:TweenSize(
	UDim2.new(0.5, 0, 0.5, 0), -- endSize (required)
	Enum.EasingDirection.In, -- easingDirection (default Out)
	Enum.EasingStyle.Sine, -- easingStyle (default Quad)
	2, -- time (default: 1)
	true, -- should this tween override ones in-progress? (default: false)
	callback -- a function to call when the tween completes (default: nil)
)

if willTween then
	print("The GuiObject will tween")
else
	print("The GuiObject will not tween")
end

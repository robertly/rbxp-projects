local TweenService = game:GetService("TweenService")

local textObject = script.Parent

local tweenInfo = TweenInfo.new(
	4, -- it takes 4 seconds for the effect to complete
	Enum.EasingStyle.Sine, -- typing starts fast and slows near the end
	Enum.EasingDirection.Out
)

local tween = TweenService:Create(textObject, tweenInfo, {
	-- Final value should be the total grapheme count
	MaxVisibleGraphemes = utf8.len(textObject.ContentText),
})

tween:Play()
tween.Completed:Wait()

-- Reset the value so it can be tweened again
textObject.MaxVisibleGraphemes = -1

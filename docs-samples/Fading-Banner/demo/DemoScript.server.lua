local TweenService = game:GetService("TweenService")

local textLabel = script.Parent

local content = {
	"Welcome to my game!",
	"Be sure to have fun!",
	"Please give suggestions!",
	"Be nice to other players!",
	"Don't grief other players!",
	"Check out the shop!",
	"Tip: Don't die!",
}

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

local RNG = Random.new()

local fadeIn = TweenService:Create(textLabel, tweenInfo, {
	TextTransparency = 0,
})

local fadeOut = TweenService:Create(textLabel, tweenInfo, {
	TextTransparency = 1,
})

local lastIndex
while true do
	-- Step 0: Fade out before doing anything
	fadeOut:Play()
	task.wait(tweenInfo.Time)

	-- Step 1: pick content that wasn't the last displayed
	local index
	repeat
		index = RNG:NextInteger(1, #content)
	until lastIndex ~= index
	-- Make sure we don't show the same thing next time
	lastIndex = index

	-- Step 2: show the content
	textLabel.Text = content[index]
	fadeIn:Play()
	task.wait(tweenInfo.Time + 1)
end

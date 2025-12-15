local KeyframeSequenceProvider = game:GetService("KeyframeSequenceProvider")

local ANIMATION_ID = "rbxassetid://507771019"

-- Get the keyframe sequence for the asset
local keyframeSequence
local success, err = pcall(function()
	keyframeSequence = KeyframeSequenceProvider:GetKeyframeSequenceAsync(ANIMATION_ID)
end)

if success then
	-- Iterate over each keyframe and print its time value
	local keyframeTable = keyframeSequence:GetKeyframes()
	for key, value in keyframeTable do
		print(`The time of keyframe number {key} is: {value.Time}`)
	end
else
	print(`Error getting KeyframeSequence: {err}`)
end

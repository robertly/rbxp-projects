local trailEffect = script.Parent

local firstColor = Color3.fromRGB(0, 255, 255)
local secondColor = Color3.fromRGB(255, 0, 0)

local firstSequence = ColorSequence.new(firstColor)
local secondSequence = ColorSequence.new(secondColor)

trailEffect.Color = firstSequence

task.wait(1.5)

trailEffect.Color = secondSequence

local trailEffect = script.Parent

local startColor = Color3.fromRGB(255, 0, 0)
local endColor = Color3.fromRGB(0, 0, 255)

local sequence = ColorSequence.new(startColor, endColor)

trailEffect.Color = sequence

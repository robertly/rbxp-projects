local circleDecal = script.Parent.CirclePart.Decal

local FACE = {
	HAPPY = "rbxassetid://5436304966",
	SAD = "rbxassetid://2992391451",
}
local ROBUX_ICON = "rbxassetid://11560341132"

-- Alternate between happy and sade face textures
for _ = 1, 3 do
	circleDecal.Texture = FACE.HAPPY
	task.wait(1)
	circleDecal.Texture = FACE.SAD
	task.wait(1)
end

-- Change the texture to a white robux icon, then change its color with Color3
circleDecal.Texture = ROBUX_ICON
task.wait(1)
circleDecal.Color3 = Color3.new(1, 1, 0)
task.wait(1)
circleDecal.Color3 = Color3.new(0, 0, 1)
task.wait(1)
circleDecal.Color3 = Color3.new(0, 1, 0)
task.wait(1)

-- Increase the transparency of the decal until it is invisible
repeat
	circleDecal.Transparency = circleDecal.Transparency + 0.1
	task.wait(0.5)
until circleDecal.Transparency == 1

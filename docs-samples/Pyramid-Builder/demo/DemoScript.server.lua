local TOWER_BASE_SIZE = 30

local position = Vector3.new(50, 50, 50)

local hue = math.random()
local color0 = Color3.fromHSV(hue, 1, 1)
local color1 = Color3.fromHSV((hue + 0.35) % 1, 1, 1)

local model = Instance.new("Model")
model.Name = "Tower"

for i = TOWER_BASE_SIZE, 1, -2 do
	local part = Instance.new("Part")
	part.Size = Vector3.new(i, 2, i)
	part.Position = position
	part.Anchored = true
	part.Parent = model
	-- Tween from color0 and color1
	local perc = i / TOWER_BASE_SIZE
	part.Color = Color3.new(
		color0.R * perc + color1.R * (1 - perc),
		color0.G * perc + color1.G * (1 - perc),
		color0.B * perc + color1.B * (1 - perc)
	)

	position = position + Vector3.new(0, part.Size.Y, 0)
end
model.Parent = workspace

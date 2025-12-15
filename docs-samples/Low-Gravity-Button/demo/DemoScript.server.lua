local MOON_GRAVITY_RATIO = 1.62 / 9.81
local DEFAULT_GRAVITY = 196.2
local MOON_GRAVITY = DEFAULT_GRAVITY * MOON_GRAVITY_RATIO

-- Create a touch pad
local pad = Instance.new("Part")
pad.Size = Vector3.new(5, 1, 5)
pad.Position = Vector3.new(0, 0.5, 0)
pad.Anchored = true
pad.BrickColor = BrickColor.new("Bright green")
pad.Parent = workspace

-- Listen for pad touch
local enabled = false
local debounce = false

local function onPadTouched(_hit)
	if not debounce then
		debounce = true

		enabled = not enabled
		workspace.Gravity = enabled and MOON_GRAVITY or DEFAULT_GRAVITY

		pad.BrickColor = enabled and BrickColor.new("Bright red") or BrickColor.new("Bright green")

		task.wait(1)
		debounce = false
	end
end

pad.Touched:Connect(onPadTouched)

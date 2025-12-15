local part = script.Parent

-- Create a ClickDetector so we can tell when the part is clicked
local cd = Instance.new("ClickDetector")
cd.Parent = part

-- This function updates how the part looks based on its Anchored state
local function updateVisuals()
	if part.Anchored then
		-- When the part is anchored...
		part.BrickColor = BrickColor.new("Bright red")
		part.Material = Enum.Material.DiamondPlate
	else
		-- When the part is unanchored...
		part.BrickColor = BrickColor.new("Bright yellow")
		part.Material = Enum.Material.Wood
	end
end

local function onToggle()
	-- Toggle the anchored property
	part.Anchored = not part.Anchored

	-- Update visual state of the brick
	updateVisuals()
end

-- Update, then start listening for clicks
updateVisuals()
cd.MouseClick:Connect(onToggle)

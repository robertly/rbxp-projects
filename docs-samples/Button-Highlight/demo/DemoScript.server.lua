-- Put me inside some GuiObject, preferrably an ImageButton/TextButton
local button = script.Parent

local function onEnter()
	button.BorderSizePixel = 2
	button.BorderColor3 = Color3.new(1, 1, 0) -- Yellow
end

local function onLeave()
	button.BorderSizePixel = 1
	button.BorderColor3 = Color3.new(0, 0, 0) -- Black
end

-- Connect events
button.MouseEnter:Connect(onEnter)
button.MouseLeave:Connect(onLeave)
-- Our default state is "not hovered"
onLeave()

-- Place this LocalScript within a TextButton (or ImageButton)
local textButton = script.Parent

textButton.Text = "Click me"
textButton.Active = true

local function onActivated()
	-- This acts like a debounce
	textButton.Active = false

	-- Count backwards from 5
	for i = 5, 1, -1 do
		textButton.Text = "Time: " .. i
		task.wait(1)
	end
	textButton.Text = "Click me"

	textButton.Active = true
end

textButton.Activated:Connect(onActivated)

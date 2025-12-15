-- Place this code in a LocalScript in a TextButton
local textButton = script.Parent

local counter = 0
textButton.Text = "Click me!"

local function onActivated()
	counter = counter + 1
	textButton.Text = "Clicks: " .. counter
end

textButton.Activated:Connect(onActivated)

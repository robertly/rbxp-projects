local gui = script.Parent
local window = gui:WaitForChild("Window")
local toggleButton = gui:WaitForChild("ToggleWindow")
local closeButton = window:WaitForChild("Close")

local function toggleWindowVisbility()
	-- Flip a boolean using the `not` keyword
	window.Visible = not window.Visible
end

toggleButton.Activated:Connect(toggleWindowVisbility)
closeButton.Activated:Connect(toggleWindowVisbility)

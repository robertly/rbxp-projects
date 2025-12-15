local gui = script.Parent
local textBox = gui.TextBox

local function focusLost(enterPressed)
	if enterPressed then
		print("Focus was lost because enter was pressed!")
	else
		print("Focus was lost without enter being pressed")
	end
end

textBox.FocusLost:Connect(focusLost)

local GuiService = game:GetService("GuiService")

local textBox = script.Parent

local function gainFocus()
	textBox.Selectable = true
	GuiService.SelectedObject = textBox
end

local function loseFocus(_enterPressed, _inputObject)
	GuiService.SelectedObject = nil
	textBox.Selectable = false
end

-- The FocusLost and FocusGained event will fire because the textBox
-- is of type TextBox
textBox.Focused:Connect(gainFocus)
textBox.FocusLost:Connect(loseFocus)

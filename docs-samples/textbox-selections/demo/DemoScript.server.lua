local textBox = script.Parent

local function showSelection()
	if textBox.CursorPosition == -1 or textBox.SelectionStart == -1 then
		print("No selection")
	else
		local selectedText = string.sub(
			textBox.Text,
			math.min(textBox.CursorPosition, textBox.SelectionStart),
			math.max(textBox.CursorPosition, textBox.SelectionStart)
		)
		print('The selection is:"', selectedText, '"')
	end
end

textBox:GetPropertyChangedSignal("CursorPosition"):Connect(showSelection)
textBox:GetPropertyChangedSignal("SelectionStart"):Connect(showSelection)

local textBox = script.Parent

local function onFocused()
	task.wait(5)
	textBox:ReleaseFocus()
end

textBox.Focused:Connect(onFocused)

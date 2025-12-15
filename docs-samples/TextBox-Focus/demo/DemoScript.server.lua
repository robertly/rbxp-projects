local textBox = script.Parent

local function onFocused()
	print("Focused")
end

textBox.Focused:Connect(onFocused)

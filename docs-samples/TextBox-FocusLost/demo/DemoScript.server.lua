local textBox = script.Parent

local function onFocusLost(enterPressed, inputThatCausedFocusLost)
	if enterPressed then
		print("Player pressed Enter")
	else
		print("Player pressed", inputThatCausedFocusLost.KeyCode)
	end
end

textBox.FocusLost:Connect(onFocusLost)

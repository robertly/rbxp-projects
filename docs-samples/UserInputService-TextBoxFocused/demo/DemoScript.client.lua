local UserInputService = game:GetService("UserInputService")

local function textBoxFocused(textBox)
	textBox.BackgroundTransparency = 0
end

local function textBoxFocusReleased(textBox)
	textBox.BackgroundTransparency = 0.7
end

UserInputService.TextBoxFocused:Connect(textBoxFocused)
UserInputService.TextBoxFocusReleased:Connect(textBoxFocusReleased)

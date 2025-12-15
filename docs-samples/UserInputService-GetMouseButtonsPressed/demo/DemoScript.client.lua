local UserInputService = game:GetService("UserInputService")

-- InputBegan is a UserInputService event that fires when the player
-- begins interacting via a Human-User input device
UserInputService.InputBegan:Connect(function(_input, _gameProcessedEvent)
	-- Returns an array of the pressed MouseButtons
	local buttons = UserInputService:GetMouseButtonsPressed()

	local m1Pressed, m2Pressed = false, false
	for _, button in pairs(buttons) do
		if button.UserInputType.Name == "MouseButton1" then
			print("MouseButton1 is pressed")
			m1Pressed = true
		end

		if button.UserInputType.Name == "MouseButton2" then
			print("MouseButton2 is pressed")
			m2Pressed = true
		end

		if m1Pressed and m2Pressed then
			print("Both mouse buttons are pressed")
		end
	end
end)

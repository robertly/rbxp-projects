local UserInputService = game:GetService("UserInputService")

UserInputService.TextBoxFocusReleased:Connect(function(textbox)
	print("The name of the released focus TextBox is " .. textbox.Name)
end)

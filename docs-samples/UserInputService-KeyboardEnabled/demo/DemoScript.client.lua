local UserInputService = game:GetService("UserInputService")

if UserInputService.KeyboardEnabled then
	print("The user's device has an available keyboard!")
else
	print("The user's device does not have an available keyboard!")
end

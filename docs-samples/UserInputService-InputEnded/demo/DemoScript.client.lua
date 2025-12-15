-- In order to use the InputChanged event, the UserInputService service must be used
local UserInputService = game:GetService("UserInputService")

-- A sample function providing multiple usage cases for various types of user input
UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		print("A key has been released! Key:", input.KeyCode)
	elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
		print("The left mouse button has been released at", input.Position)
	elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
		print("The right mouse button has been released at", input.Position)
	elseif input.UserInputType == Enum.UserInputType.Touch then
		print("A touchscreen input has been released at", input.Position)
	elseif input.UserInputType == Enum.UserInputType.Gamepad1 then
		print("A button has been released on a gamepad! Button:", input.KeyCode)
	end

	if gameProcessed then
		print("The game engine internally observed this input!")
	else
		print("The game engine did not internally observe this input!")
	end
end)

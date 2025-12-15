-- In order to use the InputChanged event, you must specify a GuiObject
local gui = script.Parent

-- A sample function providing multiple usage cases for various types of user input
local function inputEnded(input)
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
end

gui.InputEnded:Connect(inputEnded)

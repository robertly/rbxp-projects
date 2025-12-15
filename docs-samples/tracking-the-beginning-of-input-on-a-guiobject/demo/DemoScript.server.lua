-- In order to use the InputBegan event, you must specify the GuiObject
local gui = script.Parent

-- A sample function providing multiple usage cases for various types of user input
local function inputBegan(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		print("A key is being pushed down! Key:", input.KeyCode)
	elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
		print("The left mouse button has been pressed down at", input.Position)
	elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
		print("The right mouse button has been pressed down at", input.Position)
	elseif input.UserInputType == Enum.UserInputType.Touch then
		print("A touchscreen input has started at", input.Position)
	elseif input.UserInputType == Enum.UserInputType.Gamepad1 then
		print("A button is being pressed on a gamepad! Button:", input.KeyCode)
	end
end

gui.InputBegan:Connect(inputBegan)

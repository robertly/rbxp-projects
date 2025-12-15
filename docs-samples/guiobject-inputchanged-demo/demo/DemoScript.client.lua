local UserInputService = game:GetService("UserInputService")

local gui = script.Parent

local function printMovement(input)
	print("Position:", input.Position)
	print("Movement Delta:", input.Delta)
end

local function inputChanged(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		print("The mouse has been moved!")
		printMovement(input)
	elseif input.UserInputType == Enum.UserInputType.MouseWheel then
		print("The mouse wheel has been scrolled!")
		print("Wheel Movement:", input.Position.Z)
	elseif input.UserInputType == Enum.UserInputType.Gamepad1 then
		if input.KeyCode == Enum.KeyCode.Thumbstick1 then
			print("The left thumbstick has been moved!")
			printMovement(input)
		elseif input.KeyCode == Enum.KeyCode.Thumbstick2 then
			print("The right thumbstick has been moved!")
			printMovement(input)
		elseif input.KeyCode == Enum.KeyCode.ButtonL2 then
			print("The pressure being applied to the left trigger has changed!")
			print("Pressure:", input.Position.Z)
		elseif input.KeyCode == Enum.KeyCode.ButtonR2 then
			print("The pressure being applied to the right trigger has changed!")
			print("Pressure:", input.Position.Z)
		end
	elseif input.UserInputType == Enum.UserInputType.Touch then
		print("The user's finger is moving on the screen!")
		printMovement(input)
	elseif input.UserInputType == Enum.UserInputType.Gyro then
		local _rotInput, rotCFrame = UserInputService:GetDeviceRotation()
		local rotX, rotY, rotZ = rotCFrame:toEulerAnglesXYZ()
		local rot = Vector3.new(math.deg(rotX), math.deg(rotY), math.deg(rotZ))
		print("The rotation of the user's mobile device has been changed!")
		print("Position", rotCFrame.p)
		print("Rotation:", rot)
	elseif input.UserInputType == Enum.UserInputType.Accelerometer then
		print("The acceleration of the user's mobile device has been changed!")
		printMovement(input)
	end
end

gui.InputChanged:Connect(inputChanged)

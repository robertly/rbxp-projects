-- We must get the UserInputService before we can use it
local UserInputService = game:GetService("UserInputService")

-- A sample function providing one usage of InputBegan
local function onInputBegan(input, _gameProcessed)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		print("The left mouse button has been pressed!")
	end
end

UserInputService.InputBegan:Connect(onInputBegan)

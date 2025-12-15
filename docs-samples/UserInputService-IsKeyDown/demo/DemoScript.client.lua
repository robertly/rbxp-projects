local UserInputService = game:GetService("UserInputService")

local shiftKeyL = Enum.KeyCode.LeftShift
local shiftKeyR = Enum.KeyCode.RightShift

-- Return whether left or right shift keys are down
local function isShiftKeyDown()
	return UserInputService:IsKeyDown(shiftKeyL) or UserInputService:IsKeyDown(shiftKeyR)
end

-- Handle user input began differently depending on whether a shift key is pressed
local function input(_input, _gameProcessedEvent)
	if isShiftKeyDown() then
		-- Shift input
		print("Shift is held!")
	else
		-- Normal input
		print("Shift is not held!")
	end
end

UserInputService.InputBegan:Connect(input)

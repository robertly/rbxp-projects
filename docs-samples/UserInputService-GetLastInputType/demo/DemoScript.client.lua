local UserInputService = game:GetService("UserInputService")

local lastInput = UserInputService:GetLastInputType()

if lastInput == Enum.UserInputType.Keyboard then
	print("Most recent input was via keyboard")
end

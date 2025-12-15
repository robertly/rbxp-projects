local UserInputService = game:GetService("UserInputService")

local activeGamepad = nil
local buttonX = Enum.KeyCode.ButtonX

local function isGamepadXDown()
	if activeGamepad then
		return UserInputService:IsGamepadButtonDown(activeGamepad, buttonX)
	end

	return false
end

local function input(_input, _gameProcessedEvent)
	if isGamepadXDown() then
		-- X Button down event
		print("X Button is held!")
	else
		-- Normal event
		print("X Button is not held!")
	end
end

local function getActiveGamepad()
	local activateGamepad = nil
	local navigationGamepads = {}

	navigationGamepads = UserInputService:GetNavigationGamepads()

	if #navigationGamepads > 1 then
		for i = 1, #navigationGamepads do
			if activateGamepad == nil or navigationGamepads[i].Value < activateGamepad.Value then
				activateGamepad = navigationGamepads[i]
			end
		end
	else
		local connectedGamepads = {}

		connectedGamepads = UserInputService:GetConnectedGamepads()

		if #connectedGamepads > 0 then
			for i = 1, #connectedGamepads do
				if activateGamepad == nil or connectedGamepads[i].Value < activateGamepad.Value then
					activateGamepad = connectedGamepads[i]
				end
			end
		end
		if activateGamepad == nil then -- nothing is connected, at least set up for gamepad1
			activateGamepad = Enum.UserInputType.Gamepad1
		end
	end

	return activateGamepad
end

if UserInputService.GamepadEnabled then
	activeGamepad = getActiveGamepad()
	UserInputService.InputBegan:Connect(input)
end

local UserInputService = game:GetService("UserInputService")

function GetActiveGamepad()
	local activateGamepad = nil
	local navigationGamepads = {}

	navigationGamepads = UserInputService:GetNavigationGamepads()

	if #navigationGamepads > 1 then
		for _index, gamepad in ipairs(navigationGamepads) do
			if activateGamepad == nil or gamepad.Value < activateGamepad.Value then
				activateGamepad = gamepad
			end
		end
	else
		local connectedGamepads = {}

		connectedGamepads = UserInputService:GetConnectedGamepads()

		if #connectedGamepads > 0 then
			for _index, gamepad in ipairs(connectedGamepads) do
				if activateGamepad == nil or gamepad.Value < activateGamepad.Value then
					activateGamepad = gamepad
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
	print(GetActiveGamepad())
end

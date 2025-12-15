local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")

local function actionHandler(actionName, inputState, inputObject)
	if inputState == Enum.UserInputState.Begin then
		print("Action Handler: " .. actionName)
		print(inputObject)
	end

	-- Since this function does not return anything, this handler will
	-- "sink" the input and no other action handlers will be called after
	-- this one.
end

local navGamepads = UserInputService:GetNavigationGamepads()
for _, gamepad in pairs(navGamepads) do
	local supportedKeyCodes = UserInputService:GetSupportedGamepadKeyCodes(gamepad)

	for _, keycode in pairs(supportedKeyCodes) do
		if keycode == Enum.KeyCode.ButtonX then
			ContextActionService:BindAction("SampleAction", actionHandler, false, Enum.KeyCode.ButtonX)
		end
		if keycode == Enum.KeyCode.X then
			ContextActionService:BindAction("SampleAction", actionHandler, false, Enum.KeyCode.X)
		end
	end
end

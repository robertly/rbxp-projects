local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")

local controller = Enum.UserInputType.Gamepad1
local buttonX = Enum.KeyCode.ButtonX

local function isSupported(gamepad, keycode)
	return UserInputService:GamepadSupports(gamepad, keycode)
end

local function action()
	print("Action")
end

if isSupported(controller, buttonX) then
	ContextActionService:BindAction("sample action", action, false, buttonX)
end

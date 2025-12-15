local UserInputService = game:GetService("UserInputService")

local states = UserInputService:GetGamepadState(Enum.UserInputType.Gamepad1)
local statesByKeyCode = {}
for _, state in pairs(states) do
	statesByKeyCode[state.KeyCode] = state
end

local thumbstick1 = statesByKeyCode[Enum.KeyCode.Thumbstick1]
while true do
	task.wait(0.1)
	print(thumbstick1.Position)
end

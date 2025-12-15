local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local actionKey = Enum.KeyCode.LeftShift
local canJump = true
local canDoubleJump = false

local function jumpRequest()
	local keysPressed = UserInputService:GetKeysPressed()
	for _, key in ipairs(keysPressed) do
		if key.KeyCode == actionKey and canJump then
			canJump = false
			canDoubleJump = true
		end
	end
end

local function stateChanged(oldState, newState)
	-- Double jump during freefall if able to
	if oldState == Enum.HumanoidStateType.Jumping and newState == Enum.HumanoidStateType.Freefall and canDoubleJump then
		canDoubleJump = false
		task.wait(0.2)
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end

	-- Allow player to jump again after they land
	if oldState == Enum.HumanoidStateType.Freefall and newState == Enum.HumanoidStateType.Landed then
		canJump = true
	end
end

UserInputService.JumpRequest:Connect(jumpRequest)
humanoid.StateChanged:Connect(stateChanged)

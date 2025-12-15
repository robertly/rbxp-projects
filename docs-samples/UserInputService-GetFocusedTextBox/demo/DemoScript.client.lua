local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local jumpKey = Enum.KeyCode.J
local isJumping = false

local function InputBegan(input, _gameProcessedEvent)
	local TextBoxFocused = UserInputService:GetFocusedTextBox()

	-- Ignore input event if player is focusing on a TextBox
	if TextBoxFocused then
		return
	end

	-- Make player jump when user presses jumpKey Key on Keyboard
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == jumpKey then
		if not isJumping then
			isJumping = true
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end

local function StateChanged(_oldState, newState)
	-- Prevent player from jumping again using jumpKey if already jumping
	if newState == Enum.HumanoidStateType.Jumping then
		isJumping = true
		-- Allow player to jump again after landing
	elseif newState == Enum.HumanoidStateType.Landed then
		isJumping = false
	end
end

UserInputService.InputBegan:Connect(InputBegan)
humanoid.StateChanged:Connect(StateChanged)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local isDoubleJumpEnabled = true

local function doubleJump()
	local character = player.Character
	if not character then
		return
	end

	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	if not humanoid then
		return
	end

	if humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
		-- Can only double jump in Freefall (in the air)
		return
	end

	if not isDoubleJumpEnabled then
		return
	end

	isDoubleJumpEnabled = false

	-- Change the humanoid state to HumanoidStateType.Jumping to force it to jump again
	humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

	-- Wait for the character to land, then allow double jumping again
	repeat
		humanoid.StateChanged:Wait()
	until humanoid:GetState() == Enum.HumanoidStateType.Landed

	isDoubleJumpEnabled = true
end

UserInputService.InputBegan:Connect(function(inputObject)
	if inputObject.KeyCode == Enum.KeyCode.Space then
		doubleJump()
	end
end)

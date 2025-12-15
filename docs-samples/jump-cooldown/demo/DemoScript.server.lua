local character = script.Parent

local JUMP_DEBOUNCE = 1

local humanoid = character:WaitForChild("Humanoid")

local isJumping = false
humanoid.StateChanged:Connect(function(_oldState, newState)
	if newState == Enum.HumanoidStateType.Jumping then
		if not isJumping then
			isJumping = true
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
		end
	elseif newState == Enum.HumanoidStateType.Landed then
		if isJumping then
			isJumping = false
			task.wait(JUMP_DEBOUNCE)
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
		end
	end
end)

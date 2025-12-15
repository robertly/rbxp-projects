local humanoid = script.Parent:WaitForChild("Humanoid")

-- Set state
humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)

-- Get state
print(humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping)) -- false

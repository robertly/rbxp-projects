local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Fires when the user tries to jump
local function jump()
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
end

UserInputService.JumpRequest:Connect(jump)

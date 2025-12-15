local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer
local character = localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Run this function whenever the humanoid's health changes
local function onHealthChanged(healthAmount: number)
	print(("%s has %d health left."):format(localPlayer.Name, healthAmount))
end
humanoid.HealthChanged:Connect(onHealthChanged)

-- Subtract 10 from the humanoid's health every second until their health is 0
repeat
	humanoid.Health = humanoid.Health - 10
	task.wait(1)
until humanoid.Health == 0

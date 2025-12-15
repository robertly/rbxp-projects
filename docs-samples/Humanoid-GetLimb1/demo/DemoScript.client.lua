local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

for _, child in pairs(character:GetChildren()) do
	local limb = humanoid:GetLimb(child)
	if limb ~= Enum.Limb.Unknown then
		print(child.Name .. " is part of limb " .. limb.Name)
	end
end

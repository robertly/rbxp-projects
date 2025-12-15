local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local humanoid

while not humanoid do
	humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		character.ChildAdded:Wait()
	end
end

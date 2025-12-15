local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onStateEnabledChanged(state, enabled)
	if enabled then
		print(state.Name .. " has been enabled")
	else
		print(state.Name .. " has been disabled")
	end
end

humanoid.StateEnabledChanged:Connect(onStateEnabledChanged)

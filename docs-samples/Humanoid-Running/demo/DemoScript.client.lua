local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onRunning(speed: number)
	if speed > 0 then
		print(`{localPlayer.Name} is running`)
	else
		print(`{localPlayer.Name} has stopped`)
	end
end

humanoid.Running:Connect(function(speed: number)
	onRunning(speed)
end)

local Players = game:GetService("Players")

local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onPlatformStanding(isPlatformStanding)
	if isPlatformStanding then
		print("The player is PlatformStanding")
	else
		print("The player is not PlatformStanding")
	end
end

humanoid.PlatformStanding:Connect(onPlatformStanding)

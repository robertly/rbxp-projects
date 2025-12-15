--!strict

local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer :: Player

local connections = {}

local function listenToEvents(humanoid: Humanoid)
	local climbingConnection = humanoid.Climbing:Connect(function(speed)
		print("Climbing speed: ", speed)
	end)

	local fallingConnection = humanoid.FallingDown:Connect(function(isActive)
		print("Falling down: ", isActive)
	end)

	local gettingUpConnection = humanoid.GettingUp:Connect(function(isActive)
		print("Getting up: ", isActive)
	end)

	local jumpingConnection = humanoid.Jumping:Connect(function(isActive)
		print("Jumping: ", isActive)
	end)

	local platformStandingConnection = humanoid.PlatformStanding:Connect(function(isActive)
		print("PlatformStanding: ", isActive)
	end)

	local ragdollConnection = humanoid.Ragdoll:Connect(function(isActive)
		print("Ragdoll: ", isActive)
	end)

	local runningConnection = humanoid.Running:Connect(function(speed)
		print("Running speed: ", speed)
	end)

	local strafingConnection = humanoid.Strafing:Connect(function(isActive)
		print("Strafing: ", isActive)
	end)

	local swimmingConnection = humanoid.Swimming:Connect(function(speed)
		print("Swimming speed: ", speed)
	end)

	-- We are storing these connections, so they can be disconnected when the player respawns
	connections = {
		climbingConnection,
		fallingConnection,
		gettingUpConnection,
		jumpingConnection,
		platformStandingConnection,
		ragdollConnection,
		runningConnection,
		strafingConnection,
		swimmingConnection,
	}
end

local function onCharacterAdded(character: Model)
	-- Disconnect any connections from the previous character
	for _, connection in ipairs(connections) do
		connection:Disconnect()
	end

	local humanoid = character:WaitForChild("Humanoid") :: Humanoid

	listenToEvents(humanoid)
end

if localPlayer.Character then
	onCharacterAdded(localPlayer.Character)
end
localPlayer.CharacterAdded:Connect(onCharacterAdded)

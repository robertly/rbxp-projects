local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local SLOW_DURATION = 10

local function slowCharacter(humanoid)
	local goal = {}
	goal.WalkSpeed = 0

	local tweenInfo = TweenInfo.new(SLOW_DURATION)

	local tweenSpeed = TweenService:Create(humanoid, tweenInfo, goal)

	tweenSpeed:Play()

	return tweenSpeed
end

local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")
	local initialSpeed = humanoid.WalkSpeed
	local tweenSpeed = slowCharacter(humanoid)
	tweenSpeed.Completed:Wait()
	humanoid.WalkSpeed = initialSpeed
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)

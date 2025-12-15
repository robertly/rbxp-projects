local StarterPlayer = game:GetService("StarterPlayer")

local function freezeHumanoid(humanoid: Humanoid)
	humanoid.WalkSpeed = 0
	humanoid.JumpHeight = 0
end

local function unfreezeHumanoid(humanoid: Humanoid)
	humanoid.WalkSpeed = StarterPlayer.CharacterWalkSpeed
	humanoid.JumpHeight = StarterPlayer.CharacterJumpHeight
end

local function onTouched(hitPart: BasePart)
	local character = hitPart.Parent
	local humanoid = character and character:FindFirstChild("Humanoid")
	if humanoid then
		if humanoid.WalkSpeed > 0 then
			freezeHumanoid(humanoid)
			print("Humanoid frozen, thawing in 3 seconds..")
			task.wait(3)
			unfreezeHumanoid(humanoid)
		end
	end
end

script.Parent.Touched:Connect(onTouched)

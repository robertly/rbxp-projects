local character = script.Parent

local primaryPart = character.PrimaryPart

-- create particles
local particles = Instance.new("ParticleEmitter")
particles.Size = NumberSequence.new(1)
particles.Transparency = NumberSequence.new(0, 1)
particles.Acceleration = Vector3.new(0, -10, 0)
particles.Lifetime = NumberRange.new(1)
particles.Rate = 20
particles.EmissionDirection = Enum.NormalId.Back
particles.Enabled = false
particles.Parent = primaryPart

local humanoid = character:WaitForChild("Humanoid")

local isJumping = false

-- listen to humanoid state
local function onStateChanged(_oldState, newState)
	if newState == Enum.HumanoidStateType.Jumping then
		if not isJumping then
			isJumping = true
			particles.Enabled = true
		end
	elseif newState == Enum.HumanoidStateType.Landed then
		if isJumping then
			isJumping = false
			particles.Enabled = false
		end
	end
end

humanoid.StateChanged:Connect(onStateChanged)

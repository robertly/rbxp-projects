local emitter = Instance.new("ParticleEmitter")
-- Number of particles = Rate * Lifetime
emitter.Rate = 5 -- Particles per second
emitter.Lifetime = NumberRange.new(1, 1) -- How long the particles should be alive (min, max)
emitter.Enabled = true

-- Visual properties
emitter.Texture = "rbxassetid://1266170131" -- A transparent image of a white ring
-- For Color, build a ColorSequence using ColorSequenceKeypoint
local colorKeypoints = {
	-- API: ColorSequenceKeypoint.new(time, color)
	ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), -- At t=0, White
	ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.5, 0)), -- At t=.5, Orange
	ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0)), -- At t=1, Red
}
emitter.Color = ColorSequence.new(colorKeypoints)
local numberKeypoints = {
	-- API: NumberSequenceKeypoint.new(time, size, envelop)
	NumberSequenceKeypoint.new(0, 1), -- At t=0, fully transparent
	NumberSequenceKeypoint.new(0.1, 0), -- At t=.1, fully opaque
	NumberSequenceKeypoint.new(0.5, 0.25), -- At t=.5, mostly opaque
	NumberSequenceKeypoint.new(1, 1), -- At t=1, fully transparent
}
emitter.Transparency = NumberSequence.new(numberKeypoints)
emitter.LightEmission = 1 -- When particles overlap, multiply their color to be brighter
emitter.LightInfluence = 0 -- Don't be affected by world lighting

-- Speed properties
emitter.EmissionDirection = Enum.NormalId.Front -- Emit forwards
emitter.Speed = NumberRange.new(0, 0) -- Speed of zero
emitter.Drag = 0 -- Apply no drag to particle motion
emitter.VelocitySpread = NumberRange.new(0, 0)
emitter.VelocityInheritance = 0 -- Don't inherit parent velocity
emitter.Acceleration = Vector3.new(0, 0, 0)
emitter.LockedToPart = false -- Don't lock the particles to the parent
emitter.SpreadAngle = Vector2.new(0, 0) -- No spread angle on either axis

-- Simulation properties
local numberKeypoints2 = {
	NumberSequenceKeypoint.new(0, 0), -- At t=0, size of 0
	NumberSequenceKeypoint.new(1, 10), -- At t=1, size of 10
}
emitter.Size = NumberSequence.new(numberKeypoints2)
emitter.ZOffset = -1 -- Render slightly behind the actual position
emitter.Rotation = NumberRange.new(0, 360) -- Start at random rotation
emitter.RotSpeed = NumberRange.new(0) -- Do not rotate during simulation

-- Create an attachment so particles emit from the exact same spot (concentric rings)
local attachment = Instance.new("Attachment")
attachment.Position = Vector3.new(0, 5, 0) -- Move the attachment upwards a little
attachment.Parent = script.Parent
emitter.Parent = attachment

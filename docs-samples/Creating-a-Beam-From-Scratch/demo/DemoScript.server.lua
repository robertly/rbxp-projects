-- create attachments
local att0 = Instance.new("Attachment")
local att1 = Instance.new("Attachment")

-- parent to terrain (can be part instead)
att0.Parent = workspace.Terrain
att1.Parent = workspace.Terrain

-- position attachments
att0.Position = Vector3.new(0, 10, 0)
att1.Position = Vector3.new(0, 10, 10)

-- create beam
local beam = Instance.new("Beam")
beam.Attachment0 = att0
beam.Attachment1 = att1

-- appearance properties
beam.Color = ColorSequence.new({ -- a color sequence shifting from white to blue
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255)),
})
beam.LightEmission = 1 -- use additive blending
beam.LightInfluence = 0 -- beam not influenced by light
beam.Texture = "rbxasset://textures/particles/sparkles_main.dds" -- a built in sparkle texture
beam.TextureMode = Enum.TextureMode.Wrap -- wrap so length can be set by TextureLength
beam.TextureLength = 1 -- repeating texture is 1 stud long
beam.TextureSpeed = 1 -- slow texture speed
beam.Transparency = NumberSequence.new({ -- beam fades out at the end
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.8, 0),
	NumberSequenceKeypoint.new(1, 1),
})
beam.ZOffset = 0 -- render at the position of the beam without offset

-- shape properties
beam.CurveSize0 = 2 -- create a curved beam
beam.CurveSize1 = -2 -- create a curved beam
beam.FaceCamera = true -- beam is visible from every angle
beam.Segments = 10 -- default curve resolution
beam.Width0 = 0.2 -- starts small
beam.Width1 = 2 -- ends big

-- parent beam
beam.Enabled = true
beam.Parent = att0

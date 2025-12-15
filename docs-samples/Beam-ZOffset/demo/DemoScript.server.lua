-- create beams
local beam1 = Instance.new("Beam")
beam1.Color = ColorSequence.new(Color3.new(1, 0, 0))
beam1.FaceCamera = true
beam1.Width0 = 3
beam1.Width1 = 3

local beam2 = Instance.new("Beam")
beam2.Color = ColorSequence.new(Color3.new(0, 1, 0))
beam2.FaceCamera = true
beam2.Width0 = 2
beam2.Width1 = 2

local beam3 = Instance.new("Beam")
beam3.Color = ColorSequence.new(Color3.new(0, 0, 1))
beam3.FaceCamera = true
beam3.Width0 = 1
beam3.Width1 = 1

-- layer beams
beam1.ZOffset = 0
beam2.ZOffset = 0.01
beam3.ZOffset = 0.02

-- create attachments
local attachment0 = Instance.new("Attachment")
attachment0.Position = Vector3.new(0, 5, 0)
attachment0.Parent = workspace.Terrain

local attachment1 = Instance.new("Attachment")
attachment1.Position = Vector3.new(0, 15, 0)
attachment1.Parent = workspace.Terrain

-- connect beams
beam1.Attachment0 = attachment0
beam1.Attachment1 = attachment1

beam2.Attachment0 = attachment0
beam2.Attachment1 = attachment1

beam3.Attachment0 = attachment0
beam3.Attachment1 = attachment1

-- parent beams
beam1.Parent = workspace
beam2.Parent = workspace
beam3.Parent = workspace

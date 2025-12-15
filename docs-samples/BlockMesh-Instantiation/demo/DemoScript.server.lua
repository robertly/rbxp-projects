local part = Instance.new("Part")
part.Position = Vector3.new(0, 2, 0)
part.Size = Vector3.new(5, 2, 5)
part.Anchored = true

local mesh = Instance.new("BlockMesh")
mesh.Scale = Vector3.new(0.5, 0.5, 0.5)
mesh.Offset = Vector3.new(0, 2, 0)
mesh.Parent = part

local adornment = Instance.new("SelectionBox")
adornment.Adornee = part
adornment.Parent = part

part.Parent = workspace

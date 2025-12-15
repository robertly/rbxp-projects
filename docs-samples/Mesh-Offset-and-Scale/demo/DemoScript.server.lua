local TweenService = game:GetService("TweenService")

-- instance a part and a mesh
local part = Instance.new("Part")
part.Size = Vector3.new(4, 8, 4)
part.Position = Vector3.new(0, 4, 0)
part.Anchored = true
part.CanCollide = false

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://1086413449"
mesh.TextureId = "rbxassetid://1461576423"
mesh.Offset = Vector3.new(0, 0, 0)
mesh.Scale = Vector3.new(4, 4, 4)
mesh.Parent = part

-- selection box to show part extents
local box = Instance.new("SelectionBox")
box.Adornee = part
box.Parent = part

-- parent part to workspace
part.Parent = workspace

-- animate offset and scale with a tween
local tween = TweenService:Create(
	mesh,
	TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0),
	{ Scale = Vector3.new(1, 1, 1), Offset = Vector3.new(0, 3, 0) }
)

tween:Play()

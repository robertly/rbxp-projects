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
mesh.VertexColor = Vector3.new(1, 1, 1)
mesh.Parent = part

-- parent part to workspace
part.Parent = workspace

-- create tweens
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local blackTween = TweenService:Create(mesh, tweenInfo, { VertexColor = Vector3.new(0, 0, 0) })
local redTween = TweenService:Create(mesh, tweenInfo, { VertexColor = Vector3.new(1, 0, 0) })
local greenTween = TweenService:Create(mesh, tweenInfo, { VertexColor = Vector3.new(0, 1, 0) })
local blueTween = TweenService:Create(mesh, tweenInfo, { VertexColor = Vector3.new(0, 0, 1) })
local resetTween = TweenService:Create(mesh, tweenInfo, { VertexColor = Vector3.new(1, 1, 1) })

-- animate
while true do
	blackTween:Play()
	blackTween.Completed:Wait()
	redTween:Play()
	redTween.Completed:Wait()
	greenTween:Play()
	greenTween.Completed:Wait()
	blueTween:Play()
	blueTween.Completed:Wait()
	resetTween:Play()
	resetTween.Completed:Wait()
	task.wait()
end

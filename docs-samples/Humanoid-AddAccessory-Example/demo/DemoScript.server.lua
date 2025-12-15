local playerModel = script.Parent
local humanoid = playerModel:WaitForChild("Humanoid")

local clockworksShades = Instance.new("Accessory")
clockworksShades.Name = "ClockworksShades"

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1.6, 1)
handle.Parent = clockworksShades

local faceFrontAttachment = Instance.new("Attachment")
faceFrontAttachment.Name = "FaceFrontAttachment"
faceFrontAttachment.Position = Vector3.new(0, -0.24, -0.45)
faceFrontAttachment.Parent = handle

local mesh = Instance.new("SpecialMesh")
mesh.Name = "Mesh"
mesh.Scale = Vector3.new(1, 1.3, 1)
mesh.MeshId = "rbxassetid://1577360"
mesh.TextureId = "rbxassetid://1577349"
mesh.Parent = handle

humanoid:AddAccessory(clockworksShades)

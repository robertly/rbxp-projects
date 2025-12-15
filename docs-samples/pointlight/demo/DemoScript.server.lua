local part = Instance.new("Part")
part.Anchored = true
part.Position = Vector3.new(0, 0, 0)
part.Parent = workspace

local light = Instance.new("PointLight")
light.Color = Color3.new(1, 1, 1)
light.Brightness = 1
light.Range = 16
light.Parent = part

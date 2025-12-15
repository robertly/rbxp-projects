local part = Instance.new("Part")
part.Anchored = true
part.Position = Vector3.new(0, 0, 0)
part.Parent = workspace

local light = Instance.new("SurfaceLight")
light.Color = Color3.fromRGB(255, 255, 255)
light.Brightness = 1
light.Range = 16
light.Parent = part

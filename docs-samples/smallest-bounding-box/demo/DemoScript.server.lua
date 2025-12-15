local Workspace = game:GetService("Workspace")
local model = script.Parent.Model

-- Create a part to represent the smallest bounding box of 'model'
local demoVisual = Instance.new("Part")
demoVisual.Anchored = true
demoVisual.CanCollide = false
demoVisual.Transparency = 0.7
demoVisual.Color = Color3.new(1, 1, 0)

demoVisual.CFrame = model:GetBoundingBox()
demoVisual.Size = model:GetExtentsSize()

demoVisual.Parent = Workspace

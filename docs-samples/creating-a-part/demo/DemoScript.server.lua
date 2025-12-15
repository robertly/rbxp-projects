local Workspace = game:GetService("Workspace")

-- Instantiate a new Part.
local part = Instance.new("Part")

-- Configure various properties for the Part.
part.Name = "MyNewPart"
part.Anchored = true
part.Shape = Enum.PartType.CornerWedge
part.Color = Color3.new(0, 1, 0)
part.Position = Vector3.new(0, 10, -10)
part.Size = Vector3.new(8, 7, 5)

-- Part will not appear until it is parented.
part.Parent = Workspace

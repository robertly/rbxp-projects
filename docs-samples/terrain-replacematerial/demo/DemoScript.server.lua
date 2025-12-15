local Workspace = game:GetService("Workspace")

local terrain = Workspace.Terrain
local region = Region3.new(Vector3.new(-20, -20, -20), Vector3.new(20, 20, 20))
local resolution = 4
local materialToReplace = Enum.Material.Grass
local replacementMaterial = Enum.Material.Asphalt

terrain:ReplaceMaterial(region, resolution, materialToReplace, replacementMaterial)

local Workspace = game:GetService("Workspace")

local terrain = Workspace.Terrain
local maxExtents = terrain.MaxExtents
local terrainRegion = terrain:CopyRegion(maxExtents)

terrain:Clear()
task.wait(5)
terrain:PasteRegion(terrainRegion, maxExtents.Min, true)

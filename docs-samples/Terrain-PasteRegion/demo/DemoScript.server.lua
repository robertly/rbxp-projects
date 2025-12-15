--[[
    Note: The use of int16 variants for these API is the result of legacy code.
    The underlying voxel grid system uses Vector3int32 (Vector3).
]]

local Workspace = game:GetService("Workspace")

local Terrain = Workspace.Terrain

-- Create a simple terrain region (a 10x10x10 block of grass)
local initialRegion = Region3.new(Vector3.zero, Vector3.one * 10)
Terrain:FillRegion(initialRegion, 4, Enum.Material.Grass)

-- Copy the region using Terrain:CopyRegion
local copyRegion = Region3int16.new(Vector3int16.new(0, 0, 0), Vector3int16.new(10, 10, 10))
local copiedRegion = Terrain:CopyRegion(copyRegion)

-- Define where to paste the region (in this example, offsetting by 5 studs on the X-axis)
local newRegionCorner = Vector3int16.new(5, 0, 0)

-- Paste the region using Terrain:PasteRegion
Terrain:PasteRegion(copiedRegion, newRegionCorner, true)

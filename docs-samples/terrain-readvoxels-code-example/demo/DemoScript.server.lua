local REGION_START = Vector3.new(-20, -20, -20)
local REGION_END = Vector3.new(20, 20, 20)

local function printRegion(terrain, region)
	local materials, occupancies = terrain:ReadVoxels(region, 4)

	local size = materials.Size -- Same as occupancies.Size

	for x = 1, size.X, 1 do
		for y = 1, size.Y, 1 do
			for z = 1, size.Z, 1 do
				print(("(%2i, %2i, %2i): %.2f %s"):format(x, y, z, occupancies[x][y][z], materials[x][y][z].Name))
			end
		end
	end
end

local region = Region3.new(REGION_START, REGION_END)

printRegion(workspace.Terrain, region)

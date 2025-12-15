local REGION_START = Vector3.new(-20, -20, -20)
local REGION_END = Vector3.new(20, 20, 20)

local CFRAME = CFrame.new(0, 20, 0)
local SIZE = 50

local function getRegionVolumeVoxels(region)
	local resolution = 4
	local size = region.Size
	return (size.x / resolution) * (size.y / resolution) * (size.z / resolution)
end

local function isRegionTooLargeForReadWriteVoxels(region)
	return getRegionVolumeVoxels(region) > 4194304
end

local function isRegionTooLarge(region)
	return getRegionVolumeVoxels(region) > 67108864
end

-- Helper function to get an axis-aligned Region3 from the given cframe and size
local function getAABBRegion(cframe, size)
	local inv = cframe:Inverse()
	local x = size * inv.RightVector
	local y = size * inv.UpVector
	local z = size * inv.LookVector

	local w = math.abs(x.X) + math.abs(x.Y) + math.abs(x.Z)
	local h = math.abs(y.X) + math.abs(y.Y) + math.abs(y.Z)
	local d = math.abs(z.X) + math.abs(z.Y) + math.abs(z.Z)

	local pos = cframe.Position
	local halfSize = Vector3.new(w, h, d) / 2

	return Region3.new(pos - halfSize, pos + halfSize):ExpandToGrid(4)
end

-- Specific functions for checking individual methods

local function isRegionTooLargeForFillBall(cframe, radius)
	local diameter = radius * 2
	return isRegionTooLarge(getAABBRegion(cframe, Vector3.new(diameter, diameter, diameter)))
end

local function isRegionTooLargeForFillBlock(cframe, size)
	return isRegionTooLarge(getAABBRegion(cframe, size))
end

local function isRegionTooLargeForFillCylinder(cframe, height, radius)
	local diameter = radius * 2
	return isRegionTooLarge(getAABBRegion(cframe, Vector3.new(diameter, height, diameter)))
end

local function isRegionTooLargeForFillRegion(region)
	return isRegionTooLarge(region)
end

local function isRegionTooLargeForFillWedge(cframe, size)
	return isRegionTooLarge(getAABBRegion(cframe, size))
end

local function isRegionTooLargeForReplaceMaterial(region)
	return isRegionTooLarge(region)
end

local region = Region3.new(REGION_START, REGION_END)

print(isRegionTooLargeForReadWriteVoxels(region))
print(isRegionTooLargeForFillBall(CFRAME, SIZE))
print(isRegionTooLargeForFillBlock(CFRAME, SIZE))
print(isRegionTooLargeForFillCylinder(CFRAME, SIZE, SIZE))
print(isRegionTooLargeForFillRegion(region))
print(isRegionTooLargeForFillWedge(CFRAME, SIZE))
print(isRegionTooLargeForReplaceMaterial(region))

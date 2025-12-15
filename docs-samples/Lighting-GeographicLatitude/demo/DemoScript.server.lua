local Lighting = game:GetService("Lighting")

local UNIT_Z = Vector3.new(0, 0, 1)
local EARTH_TILT = math.rad(23.5) -- The Earth's tilt in radians.
local HALF_SOLAR_YEAR = 182.6282 -- Half the length of an average solar year

local function getSunDirection()
	local gameTime = Lighting:GetMinutesAfterMidnight()
	local geoLatitude = Lighting.GeographicLatitude

	local dayTime = gameTime / 1440
	local sourceAngle = 2 * math.pi * dayTime

	local sunPosition = Vector3.new(math.sin(sourceAngle), -math.cos(sourceAngle), 0)
	local latRad = math.rad(geoLatitude)

	local sunOffset = -EARTH_TILT * math.cos(math.pi * (dayTime - HALF_SOLAR_YEAR) / HALF_SOLAR_YEAR) - latRad
	local sunRotation = CFrame.fromAxisAngle(UNIT_Z:Cross(sunPosition), sunOffset)

	local sunDirection = sunRotation * sunPosition
	return sunDirection
end

print(getSunDirection())

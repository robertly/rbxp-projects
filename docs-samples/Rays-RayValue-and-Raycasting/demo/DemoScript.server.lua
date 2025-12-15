local origin = Vector3.new(0, 0, 0)
local direction = Vector3.new(0, 0, -100)
local ray = Ray.new(origin, direction)

local rayValue = Instance.new("RayValue")
rayValue.Value = ray

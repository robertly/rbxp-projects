local vector3Value = Instance.new("Vector3Value")

-- Store a Vector2 in a Vector3
local vector2 = Vector2.new(42, 70)
vector3Value.Value = Vector3.new(vector2.X, vector2.Y, 0) -- The Z value is ignored

-- Load a Vector2 from a Vector3
vector2 = Vector2.new(vector3Value.Value.X, vector3Value.Value.Y)

print(vector2)

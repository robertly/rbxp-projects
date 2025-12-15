local value = Instance.new("RayValue")
value.Parent = workspace

value.Changed:Connect(function(NewValue)
	print(NewValue)
end)

local start = Vector3.new(0, 0, 0)
local lookAt = Vector3.new(10, 10, 10)
local ray = Ray.new(start, (lookAt - start).Unit)
value.Value = ray

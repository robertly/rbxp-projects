local value = Instance.new("IntValue")
value.Parent = workspace

local function onValueChanged(newValue)
	print(newValue)
end

value.Changed:Connect(onValueChanged)

value.Value = 20

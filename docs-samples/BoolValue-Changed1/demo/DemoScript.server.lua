local boolValue = script.Parent.BoolValue

local function printValue(value)
	print(value)
end

boolValue.Changed:Connect(printValue)

boolValue.Value = true

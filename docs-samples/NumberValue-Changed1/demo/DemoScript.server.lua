local numberValue = script.Parent.NumberValue

local function printValue(value)
	print(value)
end

numberValue.Changed:Connect(printValue)

numberValue.Value = 20

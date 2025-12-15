local objectValue = script.Parent.ObjectValue
local part = script.Parent.Part

local function printObject(object)
	print(object:GetFullName())
end

objectValue.Changed:Connect(printObject)

objectValue.Value = part

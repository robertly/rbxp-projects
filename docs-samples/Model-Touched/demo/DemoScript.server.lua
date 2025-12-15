local model = script.Parent

local function onModelTouched(part)
	-- Filter any instances of the model coming in contact with itself
	if part:IsDescendantOf(model) then
		return
	end
	print(model:GetFullName(), "was touched by", part:GetFullName())
end

for _, child in pairs(model:GetChildren()) do
	if child:IsA("BasePart") then
		child.Touched:Connect(onModelTouched)
	end
end

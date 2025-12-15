local function onDescendantAdded(descendant)
	print(descendant)
end

workspace.DescendantAdded:Connect(onDescendantAdded)

local part = Instance.new("Part")
part.Parent = workspace

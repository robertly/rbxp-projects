local function onChildAdded(instance)
	print(instance.Name .. " added to the workspace")
end

workspace.ChildAdded:Connect(onChildAdded)

local part = Instance.new("Part")
part.Parent = workspace --> Part added to the Workspace

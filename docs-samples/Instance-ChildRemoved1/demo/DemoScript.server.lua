local function onChildRemoved(instance)
	print(instance.Name .. " removed from the workspace")
end

workspace.ChildRemoved:Connect(onChildRemoved)

local part = Instance.new("Part")
part.Parent = workspace

task.wait(2)

part:Destroy()

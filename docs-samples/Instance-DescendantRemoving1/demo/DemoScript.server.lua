workspace.DescendantRemoving:Connect(function(descendant)
	print(descendant.Name .. " is currently parented to " .. tostring(descendant.Parent))
end)
local part = Instance.new("Part")
part.Parent = workspace
part.Parent = nil
--> Part is currently parented to Workspace
print(part.Parent)
--> nil

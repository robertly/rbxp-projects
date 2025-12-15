local Workspace = game:GetService("Workspace")

local part = Instance.new("Part")
part.Parent = Workspace

local function onPartDestroying()
	print("Before yielding:", part:GetFullName(), #part:GetChildren())
	task.wait()
	print("After yielding:", part:GetFullName(), #part:GetChildren())
end

part.Destroying:Connect(onPartDestroying)

part:Destroy()

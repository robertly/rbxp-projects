-- Create a simple hierarchy
local model = Instance.new("Model")
local part = Instance.new("Part")
part.Parent = model
local fire = Instance.new("Fire")
fire.Parent = part

print(fire:GetFullName()) --> Model.Part.Fire

model.Parent = workspace

print(fire:GetFullName()) --> Workspace.Model.Part.Fire

part.Name = "Hello, world"

print(fire:GetFullName()) --> Workspace.Model.Hello, world.Fire

local Workspace = game:GetService("Workspace")

print(Workspace:IsA("Workspace")) -- true
print(Workspace:IsA("BasePart")) -- false
print(Workspace:IsA("Instance")) -- true

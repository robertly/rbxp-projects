local Workspace = game:GetService("Workspace")
local spawnLocation = Workspace.SpawnLocation
local decal = spawnLocation.Decal

-- These statements are true
print(Workspace:IsAncestorOf(spawnLocation))
print(Workspace:IsAncestorOf(decal))
print(spawnLocation:IsAncestorOf(decal))

-- These statements are false
print(spawnLocation:IsAncestorOf(Workspace))
print(decal:IsAncestorOf(Workspace))
print(decal:IsAncestorOf(spawnLocation))

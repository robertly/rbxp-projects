local Workspace = game:GetService("Workspace")

local mainPart = script.Parent.PartA
local otherParts = { script.Parent.PartB, script.Parent.PartC }

-- Perform union operation
local success, newUnion = pcall(function()
	return mainPart:UnionAsync(otherParts)
end)

-- If operation succeeds, position it at the same location and parent it to the workspace
if success and newUnion then
	newUnion.Position = mainPart.Position
	newUnion.Parent = Workspace
end

-- Destroy original parts which remain intact after operation
mainPart:Destroy()
for _, part in otherParts do
	part:Destroy()
end

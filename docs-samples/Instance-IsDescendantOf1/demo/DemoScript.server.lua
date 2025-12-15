local part = Instance.new("Part")
print(part:IsDescendantOf(game))
--> false

part.Parent = workspace
print(part:IsDescendantOf(game))
--> true

part.Parent = game
print(part:IsDescendantOf(game))
--> true

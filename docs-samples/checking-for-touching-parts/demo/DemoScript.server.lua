local part1 = Instance.new("Part")
part1.Name = "Part1"
part1.Anchored = true
part1.Transparency = 0.5
part1.Color = Color3.fromRGB(185, 100, 38)
part1.Size = Vector3.new(2, 2, 2)
part1.Position = Vector3.new(0, 4, 0)
part1.Parent = workspace

local part2 = Instance.new("Part")
part2.Name = "Part2"
part2.Anchored = true
part2.Transparency = 0.5
part2.Color = Color3.fromRGB(200, 10, 0)
part2.Size = Vector3.new(2, 2, 2)
part2.Position = Vector3.new(0, 5, 0)
part2.Parent = workspace

local partList = { part1 }

print(workspace:ArePartsTouchingOthers(partList, 0)) -- True
print(workspace:ArePartsTouchingOthers(partList, 0.999)) -- True
print(workspace:ArePartsTouchingOthers(partList, 1)) -- False

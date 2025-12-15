local myPart = Instance.new("Part")
myPart.Size = Vector3.new(4, 6, 4)
myPart.Anchored = true
myPart.Parent = workspace

local myMass = myPart:GetMass()

print("My part's mass is " .. myMass)

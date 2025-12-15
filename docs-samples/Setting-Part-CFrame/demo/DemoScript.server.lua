local part = script.Parent:WaitForChild("Part")
local otherPart = script.Parent:WaitForChild("OtherPart")

-- Reset the part's CFrame to (0, 0, 0) with no rotation.
-- This is sometimes called the "identity" CFrame
part.CFrame = CFrame.new()

-- Set to a specific position (X, Y, Z)
part.CFrame = CFrame.new(0, 25, 10)

-- Same as above, but use a Vector3 instead
local point = Vector3.new(0, 25, 10)
part.CFrame = CFrame.new(point)

-- Set the part's CFrame to be at one point, looking at another
local lookAtPoint = Vector3.new(0, 20, 15)
part.CFrame = CFrame.lookAt(point, lookAtPoint)

-- Rotate the part's CFrame by pi/2 radians on local X axis
part.CFrame = part.CFrame * CFrame.Angles(math.pi / 2, 0, 0)
-- Rotate the part's CFrame by 45 degrees on local Y axis
part.CFrame = part.CFrame * CFrame.Angles(0, math.rad(45), 0)
-- Rotate the part's CFrame by 180 degrees on global Z axis (note the order!)
part.CFrame = CFrame.Angles(0, 0, math.pi) * part.CFrame -- Pi radians is equal to 180 degrees

-- Composing two CFrames is done using * (the multiplication operator)
part.CFrame = CFrame.new(2, 3, 4) * CFrame.new(4, 5, 6) --> equal to CFrame.new(6, 8, 10)

-- Unlike algebraic multiplication, CFrame composition is NOT communitative: a * b is not necessarily b * a!
-- Imagine * as an ORDERED series of actions. For example, the following lines produce different CFrames:
-- 1) Slide the part 5 units on X.
-- 2) Rotate the part 45 degrees around its Y axis.
part.CFrame = CFrame.new(5, 0, 0) * CFrame.Angles(0, math.rad(45), 0)
-- 1) Rotate the part 45 degrees around its Y axis.
-- 2) Slide the part 5 units on X.
part.CFrame = CFrame.Angles(0, math.rad(45), 0) * CFrame.new(5, 0, 0)

-- There is no "CFrame division", but instead simply "doing the inverse operation".
part.CFrame = CFrame.new(4, 5, 6) * CFrame.new(4, 5, 6):Inverse() --> is equal to CFrame.new(0, 0, 0)
part.CFrame = CFrame.Angles(0, 0, math.pi) * CFrame.Angles(0, 0, math.pi):Inverse() --> equal to CFrame.Angles(0, 0, 0)

-- Position a part relative to another (in this case, put our part on top of otherPart)
part.CFrame = otherPart.CFrame * CFrame.new(0, part.Size.Y / 2 + otherPart.Size.Y / 2, 0)

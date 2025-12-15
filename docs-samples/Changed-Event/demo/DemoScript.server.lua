-- Demonstrate the Changed event by creating a Part
local part = Instance.new("Part")
part.Changed:Connect(print)
-- This fires Changed with "Transparency"
part.Transparency = 0.5
-- Similarly, this fires Changed with "Number"
part.Name = "SomePart"
-- Since changing BrickColor will also change other
-- properties at the same time, this line fires Changed
-- with "BrickColor", "Color3" and "Color3uint16".
part.BrickColor = BrickColor.Red()

-- A NumberValue holds a double-precision floating-point number
local vNumber = Instance.new("NumberValue")
vNumber.Changed:Connect(print)
-- This fires Changed with 123.456 (not "Value")
vNumber.Value = 123.456
-- This does not fire Changed
vNumber.Name = "SomeNumber"

-- A StringValue stores one string
local vString = Instance.new("StringValue")
vString.Changed:Connect(print)
-- This fires Changed with "Hello" (not "Value")
vString.Value = "Hello"

local myColor3Value = script.Parent
myColor3Value.Value = Color3.new(1, 0, 0) -- Red

-- You can also store the color of a BrickColor value by accessing BrickColor's Color property, which is a Color3:
local someBrickColor = BrickColor.new("Really red")
myColor3Value.Value = someBrickColor.Color

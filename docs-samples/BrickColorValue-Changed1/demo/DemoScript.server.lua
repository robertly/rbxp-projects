local brickColorValue = script.Parent.BrickColorValue

brickColorValue.Changed:Connect(print)

brickColorValue.Value = BrickColor.new("Bright red")

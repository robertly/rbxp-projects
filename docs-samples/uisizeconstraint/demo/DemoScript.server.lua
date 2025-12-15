local StarterGui = game:GetService("StarterGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = StarterGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 400)
frame.Parent = screenGui

local constraint = Instance.new("UISizeConstraint")
constraint.MaxSize = Vector2.new(250, 250)
constraint.MinSize = Vector2.new(50, 50)
constraint.Parent = frame

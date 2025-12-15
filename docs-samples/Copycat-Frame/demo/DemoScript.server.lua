-- Place within a Frame, TextLabel, etc.
local guiObject = script.Parent

-- For this object to be rendered, it must be a descendant of a ScreenGui
local screenGui = guiObject:FindFirstAncestorOfClass("ScreenGui")

-- Create a copy
local copycat = Instance.new("Frame")
copycat.BackgroundTransparency = 0.5
copycat.BackgroundColor3 = Color3.new(0.5, 0.5, 1) -- Light blue
copycat.BorderColor3 = Color3.new(1, 1, 1) -- White

-- Orient the copy just as the original; do so "absolutely"
copycat.AnchorPoint = Vector2.new(0, 0)
copycat.Position = UDim2.new(0, guiObject.AbsolutePosition.X, 0, guiObject.AbsolutePosition.Y)
copycat.Size = UDim2.new(0, guiObject.AbsoluteSize.X, 0, guiObject.AbsoluteSize.Y)
copycat.Rotation = guiObject.AbsoluteRotation

-- Insert into ancestor ScreenGui
copycat.Parent = screenGui

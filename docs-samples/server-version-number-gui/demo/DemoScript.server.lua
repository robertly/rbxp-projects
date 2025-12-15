local StarterGui = game:GetService("StarterGui")

local versionGui = Instance.new("ScreenGui")

local textLabel = Instance.new("TextLabel")
textLabel.Position = UDim2.new(1, -10, 1, 0)
textLabel.AnchorPoint = Vector2.new(1, 1)
textLabel.Size = UDim2.new(0, 150, 0, 40)

textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextStrokeTransparency = 0
textLabel.TextXAlignment = Enum.TextXAlignment.Right
textLabel.TextScaled = true

local placeVersion = game.PlaceVersion
textLabel.Text = string.format("Server version: %s", placeVersion)

textLabel.Parent = versionGui
versionGui.Parent = StarterGui

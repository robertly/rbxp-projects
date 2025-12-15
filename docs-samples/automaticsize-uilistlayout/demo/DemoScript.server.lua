-- Array of text labels/fonts/sizes to output
local labelArray = {
	{ text = "Lorem", font = Enum.Font.Creepster, size = 50 },
	{ text = "ipsum", font = Enum.Font.IndieFlower, size = 35 },
	{ text = "dolor", font = Enum.Font.Antique, size = 55 },
	{ text = "sit", font = Enum.Font.SpecialElite, size = 65 },
	{ text = "amet", font = Enum.Font.FredokaOne, size = 40 },
}

-- Create an automatically-sized parent frame
local parentFrame = Instance.new("Frame")
parentFrame.AutomaticSize = Enum.AutomaticSize.XY
parentFrame.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
parentFrame.Size = UDim2.fromOffset(25, 100)
parentFrame.Position = UDim2.fromScale(0.1, 0.1)
parentFrame.Parent = script.Parent

-- Add a list layout
local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = parentFrame

-- Set rounded corners and padding for visual aesthetics
local roundedCornerParent = Instance.new("UICorner")
roundedCornerParent.Parent = parentFrame
local uiPaddingParent = Instance.new("UIPadding")
uiPaddingParent.PaddingTop = UDim.new(0, 5)
uiPaddingParent.PaddingLeft = UDim.new(0, 5)
uiPaddingParent.PaddingRight = UDim.new(0, 5)
uiPaddingParent.PaddingBottom = UDim.new(0, 5)
uiPaddingParent.Parent = parentFrame

for i = 1, #labelArray do
	-- Create an automatically-sized text label from array
	local childLabel = Instance.new("TextLabel")
	childLabel.AutomaticSize = Enum.AutomaticSize.XY
	childLabel.Size = UDim2.fromOffset(75, 15)
	childLabel.Text = labelArray[i]["text"]
	childLabel.Font = labelArray[i]["font"]
	childLabel.TextSize = labelArray[i]["size"]
	childLabel.TextColor3 = Color3.new(1, 1, 1)
	childLabel.Parent = parentFrame

	-- Visual aesthetics
	local roundedCorner = Instance.new("UICorner")
	roundedCorner.Parent = childLabel
	local uiPadding = Instance.new("UIPadding")
	uiPadding.PaddingTop = UDim.new(0, 5)
	uiPadding.PaddingLeft = UDim.new(0, 5)
	uiPadding.PaddingRight = UDim.new(0, 5)
	uiPadding.PaddingBottom = UDim.new(0, 5)
	uiPadding.Parent = childLabel

	task.wait(2)
end

local frame = script.Parent

-- Create a TextLabel displaying each font
for _, font in pairs(Enum.Font:GetEnumItems()) do
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = font.Name
	-- Set the text properties
	textLabel.Text = font.Name
	textLabel.Font = font
	-- Some rendering properties
	textLabel.TextSize = 24
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	-- Size the frame equal to the height of the text
	textLabel.Size = UDim2.new(1, 0, 0, textLabel.TextSize)
	-- Add to the parent frame
	textLabel.Parent = frame
end

-- Layout the frames in a list (if they aren't already)
if not frame:FindFirstChildOfClass("UIListLayout") then
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.Parent = frame
end

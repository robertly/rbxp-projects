-- Lay out the images in a list
Instance.new("UIListLayout", script.Parent).SortOrder = Enum.SortOrder.LayoutOrder

-- Create some images of varying sizes using UIScale objects
for size = 0.2, 1.5, 0.2 do
	local image = Instance.new("ImageLabel")
	image.Image = "rbxassetid://284402752" -- an image of a Lock
	image.Parent = script.Parent
	image.Size = UDim2.new(0, 100, 0, 100)
	-- Scale the image by adding a UIScale with the size
	--  Note: this is a shorthand since we don't need a reference to the UIScale
	Instance.new("UIScale", image).Scale = size
end

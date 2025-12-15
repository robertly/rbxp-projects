local imageLabel = script.Parent

-- Set the source image to be a 64x64 padlock
imageLabel.Image = "rbxassetid://284402752"
imageLabel.BackgroundTransparency = 0
imageLabel.BackgroundColor3 = Color3.new(1, 1, 1) -- White
imageLabel.ImageColor3 = Color3.new(0, 0, 0) -- Black

local function resizeInACircle()
	for theta = 0, 2, 0.02 do
		imageLabel.Size =
			UDim2.new(0, 100 + math.cos(theta * 2 * math.pi) * 50, 0, 100 + math.sin(theta * 2 * math.pi) * 50)
		task.wait()
	end
end

while true do
	-- Stretch simply stretches the source image to fit
	-- the UI element's space
	imageLabel.ScaleType = Enum.ScaleType.Stretch
	resizeInACircle()
	-- Tile will render the source image multiple times
	-- enough to fill the UI element's space
	imageLabel.ScaleType = Enum.ScaleType.Tile
	imageLabel.TileSize = UDim2.new(0, 64, 0, 64)
	resizeInACircle()
	-- Slice will turn the image into a nine-slice UI.
	imageLabel.ScaleType = Enum.ScaleType.Slice
	imageLabel.SliceCenter = Rect.new(30, 30, 34, 34)
	resizeInACircle()
end

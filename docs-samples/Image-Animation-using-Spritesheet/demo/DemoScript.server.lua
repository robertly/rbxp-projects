-- Place this in an ImageLabel/ImageButton with size 256x256
local imageLabel = script.Parent

-- The following image is 1024x1024 with 12 frames (256x256)
-- The frames play an animation of a man throwing a punch
imageLabel.Image = "rbxassetid://848623155"
imageLabel.ImageRectSize = Vector2.new(256, 256)

-- The order of the frames to be displayed (left-to-right, then top-to-bottom)
local frames = {
	Vector2.new(0, 0),
	Vector2.new(1, 0),
	Vector2.new(2, 0),
	Vector2.new(3, 0),
	Vector2.new(0, 1),
	Vector2.new(1, 1),
	Vector2.new(2, 1),
	Vector2.new(3, 1),
	Vector2.new(0, 2),
	Vector2.new(1, 2),
	Vector2.new(2, 2),
	Vector2.new(3, 2),
}

-- Animate the frames one at a time in a loop
while true do
	for _, frame in ipairs(frames) do
		imageLabel.ImageRectOffset = frame * imageLabel.ImageRectSize
		task.wait(0.1)
	end
end

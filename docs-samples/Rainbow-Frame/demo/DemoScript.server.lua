-- Put this code in a LocalScript in a Frame
local frame = script.Parent

while true do
	for hue = 0, 255, 4 do
		-- HSV = hue, saturation, value
		-- If we loop from 0 to 1 repeatedly, we get a rainbow!
		frame.BorderColor3 = Color3.fromHSV(hue / 256, 1, 1)
		frame.BackgroundColor3 = Color3.fromHSV(hue / 256, 0.5, 0.8)
		task.wait()
	end
end

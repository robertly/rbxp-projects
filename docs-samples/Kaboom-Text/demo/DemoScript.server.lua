local textLabel = script.Parent

textLabel.Text = "Kaboom!"

while true do
	for size = 5, 100, 5 do
		textLabel.TextSize = size
		textLabel.TextTransparency = size / 100
		task.wait()
	end
	task.wait(1)
end

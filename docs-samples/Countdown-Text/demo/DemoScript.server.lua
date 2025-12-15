-- Place this code in a LocalScript within a TextLabel/TextButton
local textLabel = script.Parent

-- Some colors we'll use with TextColor3
local colorNormal = Color3.new(0, 0, 0) -- black
local colorSoon = Color3.new(1, 0.5, 0.5) -- red
local colorDone = Color3.new(0.5, 1, 0.5) -- green

-- Loop infinitely
while true do
	-- Count backwards from 10 to 1
	for i = 10, 1, -1 do
		-- Set the text
		textLabel.Text = "Time: " .. i
		-- Set the color based on how much time is left
		if i > 3 then
			textLabel.TextColor3 = colorNormal
		else
			textLabel.TextColor3 = colorSoon
		end
		task.wait(1)
	end
	textLabel.Text = "GO!"
	textLabel.TextColor3 = colorDone
	task.wait(2)
end

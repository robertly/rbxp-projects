local textLabel = script.Parent

while true do
	-- Iterate over all the different fonts
	for _, font in pairs(Enum.Font:GetEnumItems()) do
		textLabel.Font = font
		textLabel.Text = font.Name
		task.wait(1)
	end
end

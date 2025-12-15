local button = script.Parent

if button:IsA("ImageButton") then
	if button.HoverImage and button.ClickImage then
		return
	end
end

button.AutoButtonColor = true

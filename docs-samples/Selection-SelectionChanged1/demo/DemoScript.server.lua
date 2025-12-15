local selection = game:GetService("Selection")

selection.SelectionChanged:Connect(function()
	print("Selection contains " .. #selection:Get() .. " items.")
end)

local GuiService = game:GetService("GuiService")

local function printChanged(value)
	if value == "SelectedObject" then
		print("The SelectedObject changed!")
	end
end

GuiService.Changed:Connect(printChanged)

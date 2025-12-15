local guiObject = script.Parent
guiObject.MouseEnter:Connect(function(x, y)
	print("The user's mouse cursor has entered the GuiObject at position", x, ",", y)
end)

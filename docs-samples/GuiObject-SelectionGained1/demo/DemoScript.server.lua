local guiObject = script.Parent

local function selectionGained()
	print("The user has selected this button with a gamepad.")
end

guiObject.SelectionGained:Connect(selectionGained)

local guiObject = script.Parent

local function selectionLost()
	print("The user no longer has this selected with their gamepad.")
end

guiObject.SelectionLost:Connect(selectionLost)

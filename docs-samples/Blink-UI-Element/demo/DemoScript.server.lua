local guiObject = script.Parent

while true do
	guiObject.Visible = true
	task.wait(1)
	guiObject.Visible = false
	task.wait(1)
end

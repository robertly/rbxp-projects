-- Setup the Gamepad selection grid using the code below
local container = script.Parent:FindFirstChild("Container")
local grid = container:GetChildren()
local rowSize = container:FindFirstChild("UIGridLayout").FillDirectionMaxCells

for _, gui in pairs(grid) do
	if gui:IsA("GuiObject") then
		local pos = gui.Name

		-- Left edge
		gui.NextSelectionLeft = container:FindFirstChild(pos - 1)
		-- Right edge
		gui.NextSelectionRight = container:FindFirstChild(pos + 1)
		-- Above
		gui.NextSelectionUp = container:FindFirstChild(pos - rowSize)
		-- Below
		gui.NextSelectionDown = container:FindFirstChild(pos + rowSize)
	end
end

-- Test the Gamepad selection grid using the code below
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")

GuiService.SelectedObject = container:FindFirstChild("1")

function updateSelection(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		local key = input.KeyCode

		local selectedObject = GuiService.SelectedObject
		if not selectedObject then
			return
		end

		if key == Enum.KeyCode.Up then
			if not selectedObject.NextSelectionUp then
				GuiService.SelectedObject = selectedObject
			end
		elseif key == Enum.KeyCode.Down then
			if not selectedObject.NextSelectionDown then
				GuiService.SelectedObject = selectedObject
			end
		elseif key == Enum.KeyCode.Left then
			if not selectedObject.NextSelectionLeft then
				GuiService.SelectedObject = selectedObject
			end
		elseif key == Enum.KeyCode.Right then
			if not selectedObject.NextSelectionRight then
				GuiService.SelectedObject = selectedObject
			end
		end
	end
end

UserInputService.InputBegan:Connect(updateSelection)

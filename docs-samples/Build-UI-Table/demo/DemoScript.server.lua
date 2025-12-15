local frame = script.Parent

-- Table data
local headerWidth = { 200, 80, 80 }
local headers = {
	"Name",
	"Job",
	"Cash",
}
local data = {
	{ "Bob", "Waiter", 100 },
	{ "Lisa", "Police", 200 },
	{ "George", "-", 50 },
}

-- First, build the table layout
local uiTableLayout = Instance.new("UITableLayout")
uiTableLayout.FillDirection = Enum.FillDirection.Vertical
uiTableLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiTableLayout.VerticalAlignment = Enum.VerticalAlignment.Center
uiTableLayout.FillEmptySpaceColumns = false
uiTableLayout.FillEmptySpaceRows = false
uiTableLayout.Padding = UDim2.new(0, 5, 0, 5)
uiTableLayout.SortOrder = Enum.SortOrder.LayoutOrder
frame.Size = UDim2.new(0, 0, 0, 40) -- The Size of the parent frame is the cell size
uiTableLayout.Parent = frame

-- Next, create column headers
local headerFrame = Instance.new("Frame")
headerFrame.Name = "Headers"
headerFrame.Parent = frame
for i = 1, #headers do
	local headerText = headers[i]
	local headerCell = Instance.new("TextLabel")
	headerCell.Text = headerText
	headerCell.Name = headerText
	headerCell.LayoutOrder = i
	headerCell.Size = UDim2.new(0, 0, 0, 24)
	headerCell.Parent = headerFrame
	local headerSize = Instance.new("UISizeConstraint")
	headerSize.MinSize = Vector2.new(headerWidth[i], 0)
	headerSize.Parent = headerCell
end

-- Finally, add data rows by iterating over each row and the columns in that row
for index, value in ipairs(data) do
	local rowData = value
	local rowFrame = Instance.new("Frame")
	rowFrame.Name = "Row" .. index
	rowFrame.Parent = frame
	for col = 1, #value do
		local cellData = rowData[col]
		local cell = Instance.new("TextLabel")
		cell.Text = cellData
		cell.Name = headers[col]
		cell.TextXAlignment = Enum.TextXAlignment.Left
		if tonumber(cellData) then -- If this cell is a number, right-align it instead
			cell.TextXAlignment = Enum.TextXAlignment.Right
		end
		cell.ClipsDescendants = true
		cell.Size = UDim2.new(0, 0, 0, 24)
		cell.Parent = rowFrame
	end
end

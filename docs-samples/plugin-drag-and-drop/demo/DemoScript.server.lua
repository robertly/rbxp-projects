assert(plugin, "This script must be run as a Studio plugin")

local widgetInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, true, true, 300, 200)

local dragSourceWidget = plugin:CreateDockWidgetPluginGui("Drag Source", widgetInfo)
dragSourceWidget.Title = "Drag Source"

local textBox = Instance.new("TextBox")
textBox.Parent = dragSourceWidget
textBox.Size = UDim2.new(1, 0, 0, 32)
textBox.Text = "Hello, plugin drags"

local dragButton = Instance.new("TextButton")
dragButton.Size = UDim2.new(1, 0, 1, -32)
dragButton.Position = UDim2.new(0, 0, 0, 32)
dragButton.Text = "Edit the text above, then start drag here"
dragButton.Parent = dragSourceWidget

function onMouseButton1Down()
	local dragData = {
		Sender = "SomeDragSource",
		MimeType = "text/plain",
		Data = textBox.Text,
		MouseIcon = "",
		DragIcon = "",
		HotSpot = Vector2.new(0, 0),
	}
	plugin:StartDrag(dragData)
end

dragButton.MouseButton1Down:Connect(onMouseButton1Down)

-- This widget will receive drops
local dragTargetWidget = plugin:CreateDockWidgetPluginGui("Drop Target", widgetInfo)
dragTargetWidget.Title = "Drop Target"

-- This TextLabel will display what was dropped
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Text = "Drop here..."
textLabel.Parent = dragTargetWidget

local function onDragDrop(dragData)
	if dragData.MimeType == "text/plain" then
		textLabel.Text = dragData.Data
	else
		textLabel.Text = dragData.MimeType
	end
end

dragTargetWidget.PluginDragDropped:Connect(onDragDrop)

dragTargetWidget.PluginDragEntered:Connect(function(_dragData)
	print("PluginDragEntered")
end)

dragTargetWidget.PluginDragLeft:Connect(function(_dragData)
	print("PluginDragLeft")
end)

dragTargetWidget.PluginDragMoved:Connect(function(_dragData)
	print("PluginDragMoved")
end)

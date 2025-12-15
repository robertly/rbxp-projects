local guiObject = script.Parent

while true do
	-- Top-left
	guiObject.AnchorPoint = Vector2.new(0, 0)
	guiObject.Position = UDim2.new(0, 0, 0, 0)
	task.wait(1)
	-- Top
	guiObject.AnchorPoint = Vector2.new(0.5, 0)
	guiObject.Position = UDim2.new(0.5, 0, 0, 0)
	task.wait(1)
	-- Top-right
	guiObject.AnchorPoint = Vector2.new(1, 0)
	guiObject.Position = UDim2.new(1, 0, 0, 0)
	task.wait(1)
	-- Left
	guiObject.AnchorPoint = Vector2.new(0, 0.5)
	guiObject.Position = UDim2.new(0, 0, 0.5, 0)
	task.wait(1)
	-- Dead center
	guiObject.AnchorPoint = Vector2.new(0.5, 0.5)
	guiObject.Position = UDim2.new(0.5, 0, 0.5, 0)
	task.wait(1)
	-- Right
	guiObject.AnchorPoint = Vector2.new(1, 0.5)
	guiObject.Position = UDim2.new(1, 0, 0.5, 0)
	task.wait(1)
	-- Bottom-left
	guiObject.AnchorPoint = Vector2.new(0, 1)
	guiObject.Position = UDim2.new(0, 0, 1, 0)
	task.wait(1)
	-- Bottom
	guiObject.AnchorPoint = Vector2.new(0.5, 1)
	guiObject.Position = UDim2.new(0.5, 0, 1, 0)
	task.wait(1)
	-- Bottom-right
	guiObject.AnchorPoint = Vector2.new(1, 1)
	guiObject.Position = UDim2.new(1, 0, 1, 0)
	task.wait(1)
end

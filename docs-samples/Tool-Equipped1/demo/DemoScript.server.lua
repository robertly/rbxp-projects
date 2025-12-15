local Tool = script.Parent

local function onEquipped(_mouse)
	print("The tool was equipped")
end

Tool.Equipped:Connect(onEquipped)

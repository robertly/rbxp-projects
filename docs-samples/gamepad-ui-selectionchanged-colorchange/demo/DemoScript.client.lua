local backgroundWindow = script.Parent.BackgroundWindow

local function selectionChanged(isSelfSelected, previousSelection, newSelection)
	if newSelection and newSelection:IsDescendantOf(backgroundWindow) then
		backgroundWindow.BackgroundColor3 = Color3.new(0, 1, 0)
	else
		backgroundWindow.BackgroundColor3 = Color3.new(1, 0, 0)
	end
end

backgroundWindow.SelectionChanged:Connect(selectionChanged)

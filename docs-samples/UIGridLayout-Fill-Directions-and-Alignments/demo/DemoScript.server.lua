-- Place me in a UIListLayout
local uiGridLayout = script.Parent

while true do
	for _, fillDirection in pairs(Enum.FillDirection:GetEnumItems()) do
		uiGridLayout.FillDirection = fillDirection
		for _, verticalAlignment in pairs(Enum.VerticalAlignment:GetEnumItems()) do
			uiGridLayout.VerticalAlignment = verticalAlignment
			for _, horizontalAlignment in pairs(Enum.HorizontalAlignment:GetEnumItems()) do
				uiGridLayout.HorizontalAlignment = horizontalAlignment
				task.wait(1)
			end
		end
	end
end

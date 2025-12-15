local customScrollingFrame = script.Parent
local subFrame = customScrollingFrame:FindFirstChild("SubFrame")

local function scrollUp(_x, _y)
	if subFrame.Position.Y.Scale < 0 then
		subFrame.Position = subFrame.Position + UDim2.new(0, 0, 0.015, 0)
	elseif subFrame.Position.Y.Scale > 0 then
		subFrame.Position =
			UDim2.new(subFrame.Position.X.Scale, subFrame.Position.X.Offset, 0, subFrame.Position.Y.Offset)
	end
end

local function scrollDown(_x, _y)
	if subFrame.Position.Y.Scale > -1 then
		subFrame.Position = subFrame.Position - UDim2.new(0, 0, 0.015, 0)
	elseif subFrame.Position.Y.Scale < -1 then
		subFrame.Position =
			UDim2.new(subFrame.Position.X.Scale, subFrame.Position.X.Offset, -1, subFrame.Position.Y.Offset)
	end
end

customScrollingFrame.MouseWheelForward:Connect(scrollUp)
customScrollingFrame.MouseWheelBackward:Connect(scrollDown)

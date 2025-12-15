local frame = script.Parent
frame.Active = true

local function onTouchTap()
	-- Toggle background transparency
	if frame.BackgroundTransparency > 0 then
		frame.BackgroundTransparency = 0
	else
		frame.BackgroundTransparency = 0.75
	end
end

frame.TouchTap:Connect(onTouchTap)

local part = script.Parent

local INCREMENT = 360 / 20

-- Rotate the part continually
while true do
	for degrees = 0, 360, INCREMENT do
		-- Set only the Y axis rotation
		part.Rotation = Vector3.new(0, degrees, 0)
		-- A better way to do this would be setting CFrame
		--part.CFrame = CFrame.new(part.Position) * CFrame.Angles(0, math.rad(degrees), 0)
		task.wait()
	end
end

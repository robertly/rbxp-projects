local Workspace = game:GetService("Workspace")

local function isPointVisible(worldPoint)
	local camera = workspace.CurrentCamera
	local _, onScreen = camera:WorldToViewportPoint(worldPoint)

	if onScreen then
		local origin = camera.CFrame.Position
		local direction = worldPoint - origin

		local result = Workspace:Raycast(origin, direction)
		if result then
			return false
		end
	else
		return false
	end
	return true
end

print(isPointVisible(Vector3.new(20, 0, 0)))

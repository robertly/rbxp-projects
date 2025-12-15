local function recurseForFire(object)
	-- Check if we found a Fire object that has no Smoke
	if object:IsA("Fire") and not object.Parent:FindFirstChildOfClass("Smoke") then
		-- Create a smoke effect for this fire
		local smoke = Instance.new("Smoke")
		smoke.Color = Color3.new(0, 0, 0)
		smoke.Opacity = 0.15
		smoke.RiseVelocity = 4
		smoke.Size = object.Size / 4
		smoke.Parent = object.Parent
	end
	-- Continue search for Fire objects
	for _, child in pairs(object:GetChildren()) do
		recurseForFire(child)
	end
end

recurseForFire(workspace)

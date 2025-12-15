local function makeXRayPart(part)
	-- LocalTransparencyModifier will make parts see-through but only for the local
	-- client, and it won't replicate to the server
	part.LocalTransparencyModifier = 0.5
end

-- This function uses recursion to search for parts in the game
local function recurseForParts(object)
	if object:IsA("BasePart") then
		makeXRayPart(object)
	end

	-- Stop if this object has a Humanoid - we don't want to see-through players!
	if object:FindFirstChildOfClass("Humanoid") then
		return
	end

	-- Check the object's children for more parts
	for _, child in pairs(object:GetChildren()) do
		recurseForParts(child)
	end
end

recurseForParts(workspace)

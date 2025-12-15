-- Paste into a Script within a Model you want to unlock
local model = script.Parent

-- This function recurses through a model's heirarchy and unlocks
-- every part that it encounters.
local function recursiveUnlock(object)
	if object:IsA("BasePart") then
		object.Locked = false
	end

	-- Call the same function on the children of the object
	-- The recursive process stops if an object has no children
	for _, child in pairs(object:GetChildren()) do
		recursiveUnlock(child)
	end
end

recursiveUnlock(model)

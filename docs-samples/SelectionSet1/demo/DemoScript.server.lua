local Selection = game:GetService("Selection")

local newSelection = {}
for _, object in pairs(workspace:GetDescendants()) do
	if object:IsA("BasePart") and object.BrickColor == BrickColor.new("Bright red") then
		table.insert(newSelection, object)
	end
end

Selection:Set(newSelection)

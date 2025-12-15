local descendants = workspace:GetDescendants()

-- Loop through all of the descendants of the Workspace. If a
-- BasePart is found, the code changes that parts color to green
for _, descendant in pairs(descendants) do
	if descendant:IsA("BasePart") then
		descendant.BrickColor = BrickColor.Green()
	end
end

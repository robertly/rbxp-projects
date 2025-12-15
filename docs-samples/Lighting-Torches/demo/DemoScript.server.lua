for _, child in pairs(workspace:GetChildren()) do
	if child.Name == "Torch" and child:IsA("BasePart") then
		local fire = Instance.new("Fire")
		fire.Heat = 10
		fire.Color = child.Color
		fire.SecondaryColor = Color3.new(1, 1, 1) -- White
		fire.Size = math.max(child.Size.X, child.Size.Z) -- Pick the larger of the two dimensions
		fire.Parent = child
	end
end

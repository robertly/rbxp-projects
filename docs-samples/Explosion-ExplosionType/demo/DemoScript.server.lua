local function onDescendantAdded(instance)
	if instance:IsA("Explosion") then
		instance.ExplosionType = Enum.ExplosionType.NoCraters
		instance:GetPropertyChangedSignal("ExplosionType"):Connect(function()
			instance.ExplosionType = Enum.ExplosionType.NoCraters
		end)
	end
end

workspace.DescendantAdded:Connect(onDescendantAdded)

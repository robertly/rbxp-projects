local function onDescendantAdded(instance)
	if instance:IsA("Explosion") then
		local explosion = instance
		explosion.DestroyJointRadiusPercent = 0

		local destroyJointRadiusPercent = 1
		explosion.Hit:Connect(function(part, distance)
			-- check the part is in range to break joints
			if distance <= destroyJointRadiusPercent * explosion.BlastRadius then
				-- make sure the part does not belong to a character
				if not game.Players:GetPlayerFromCharacter(part.Parent) then
					part:BreakJoints()
				end
			end
		end)
	end
end

workspace.DescendantAdded:Connect(onDescendantAdded)

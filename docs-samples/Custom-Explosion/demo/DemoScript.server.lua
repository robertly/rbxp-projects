local function customExplosion(position, radius, maxDamage)
	local explosion = Instance.new("Explosion")
	explosion.BlastPressure = 0 -- this could be set higher to still apply velocity to parts
	explosion.DestroyJointRadiusPercent = 0 -- joints are safe
	explosion.BlastRadius = radius
	explosion.Position = position

	-- set up a table to track the models hit
	local modelsHit = {}

	-- listen for contact
	explosion.Hit:Connect(function(part, distance)
		local parentModel = part.Parent
		if parentModel then
			-- check to see if this model has already been hit
			if modelsHit[parentModel] then
				return
			end
			-- log this model as hit
			modelsHit[parentModel] = true

			-- look for a humanoid
			local humanoid = parentModel:FindFirstChild("Humanoid")
			if humanoid then
				local distanceFactor = distance / explosion.BlastRadius -- get the distance as a value between 0 and 1
				distanceFactor = 1 - distanceFactor -- flip the amount, so that lower == closer == more damage
				humanoid:TakeDamage(maxDamage * distanceFactor) -- TakeDamage to respect ForceFields
			end
		end
	end)

	explosion.Parent = game.Workspace
end

customExplosion(Vector3.new(0, 10, 0), 12, 50)

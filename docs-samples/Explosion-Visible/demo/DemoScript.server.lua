local function customExplosion(position)
	local explosion = Instance.new("Explosion")
	explosion.Position = position
	explosion.Visible = false

	local attachment = Instance.new("Attachment")
	attachment.Position = position
	attachment.Parent = workspace.Terrain

	local particleEmitter = Instance.new("ParticleEmitter")
	particleEmitter.Enabled = false
	particleEmitter.Parent = attachment
	particleEmitter.Speed = NumberRange.new(5, 30)
	particleEmitter.SpreadAngle = Vector2.new(-90, 90)

	explosion.Parent = workspace
	particleEmitter:Emit(20)

	task.delay(5, function()
		if attachment then
			attachment:Destroy()
		end
	end)
end

customExplosion(Vector3.new(0, 10, 0))

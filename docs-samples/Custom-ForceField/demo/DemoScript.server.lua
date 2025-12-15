local Players = game:GetService("Players")

local FORCE_FIELD_DURATION = 15

local function createCustomForcefield(player, duration)
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChild("Humanoid")
		if humanoid then
			-- find the torso
			local torsoName = humanoid.RigType == Enum.HumanoidRigType.R15 and "UpperTorso" or "Torso"
			local torso = character:FindFirstChild(torsoName)
			if torso then
				-- create a forcefield
				local forceField = Instance.new("ForceField")
				forceField.Visible = false -- not visible
				-- create a particle effect
				local particleEmitter = Instance.new("ParticleEmitter")
				particleEmitter.Enabled = true
				particleEmitter.Parent = torso
				-- listen for the forcefield being removed
				forceField.AncestryChanged:Connect(function(_child, parent)
					if not parent then
						if particleEmitter and particleEmitter.Parent then
							particleEmitter:Destroy()
						end
					end
				end)
				-- parent the forcefield and set it to expire
				forceField.Parent = character
				if duration then
					task.delay(duration, function()
						if forceField then
							forceField:Destroy()
						end
					end)
				end
			end
		end
	end
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function(_character)
		createCustomForcefield(player, FORCE_FIELD_DURATION)
	end)
end

Players.PlayerAdded(onPlayerAdded)

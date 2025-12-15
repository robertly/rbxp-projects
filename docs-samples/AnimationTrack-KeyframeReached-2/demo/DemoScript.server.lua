local function listenForAnimationEffects(humanoid) -- would also work for an AnimationController
	-- listen for new animations being played on the Humanoid
	humanoid.AnimationPlayed:Connect(function(animationTrack)
		local keyframeConnection = nil
		-- listen for the 'Effect' keyframe being reached
		keyframeConnection = animationTrack.KeyframeReached:Connect(function(keyframeName)
			if keyframeName == "Effect" then
				-- make sure the Humanoid RootPart exists
				if humanoid.RootPart then
					-- create a basic particle effect
					local particles = Instance.new("ParticleEmitter")
					particles.Parent = humanoid.RootPart
					particles.Rate = 0
					particles:Emit(10)
					task.delay(2, function()
						if particles then
							particles:Destroy()
						end
					end)
				end
			end
		end)
		local stoppedConnection = nil
		stoppedConnection = animationTrack.Stopped:Connect(function()
			-- clean up old connections to stop memory leaks
			keyframeConnection:Disconnect()
			stoppedConnection:Disconnect()
		end)
	end)
end

local humanoid = script.Parent:WaitForChild("Humanoid")

listenForAnimationEffects(humanoid)

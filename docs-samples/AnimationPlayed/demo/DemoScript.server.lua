local function listenForNewAnimations(humanoid)
	humanoid.AnimationPlayed:Connect(function(animationTrack)
		local animationName = animationTrack.Animation.Name
		print("Animation playing " .. animationName)
	end)
end

local humanoid = script.Parent:WaitForChild("Humanoid")

listenForNewAnimations(humanoid)

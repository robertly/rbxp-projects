local function playAnimationFromServer(character, animation)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	assert(humanoid, "No Humanoid found!")
	local animator = humanoid:FindFirstChildOfClass("Animator")
	assert(animator, "No Animator found!")

	local animationTrack = animator:LoadAnimation(animation)
	animationTrack:Play()
	return animationTrack
end

playAnimationFromServer(script.Parent.Character, script.Parent.Animation)

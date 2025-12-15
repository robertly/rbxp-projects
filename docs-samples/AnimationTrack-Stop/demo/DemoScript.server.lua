local function fadeOut(animationTrack, fadeTime)
	animationTrack:Stop(fadeTime)
	local startTime = tick()
	while animationTrack.WeightCurrent > 0 do
		task.wait()
	end
	local timeTaken = tick() - startTime
	print("Time taken for weight to reset: " .. tostring(timeTaken))
end

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507765644"

local humanoid = script.Parent:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local animationTrack = animator:LoadAnimation(animation)

animationTrack:Play()

fadeOut(animationTrack, 1)

local function changeWeight(animationTrack, weight, fadeTime)
	animationTrack:AdjustWeight(weight, fadeTime)
	local startTime = tick()
	while math.abs(animationTrack.WeightCurrent - weight) > 0.001 do
		task.wait()
	end
	print("Time taken to change weight " .. tostring(tick() - startTime))
end

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507765644"

local humanoid = script.Parent:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local animationTrack = animator:LoadAnimation(animation)

changeWeight(animationTrack, 0.6, 1)

local RunService = game:GetService("RunService")

local function studioPreviewAnimation(model, animation)
	-- find the AnimationController and Animator
	local animationController = model:FindFirstChildOfClass("Humanoid")
		or model:FindFirstChildOfClass("AnimationController")
	local animator = animationController and animationController:FindFirstChildOfClass("Animator")
	if not animationController or not animator then
		return
	end

	-- load the Animation to create an AnimationTrack
	local track = animationController:LoadAnimation(animation)
	track:Play()

	-- preview the animation
	local startTime = tick()
	while (tick() - startTime) < track.Length do
		local step = RunService.Heartbeat:wait()
		animator:StepAnimations(step)
	end

	-- stop the animation
	track:Stop(0)
	animator:StepAnimations(0)

	-- reset the joints
	for _, descendant in pairs(model:GetDescendants()) do
		if descendant:IsA("Motor6D") then
			local joint = descendant
			joint.CurrentAngle = 0
			joint.Transform = CFrame.new()
		end
	end
end

local character = script.Parent

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507765644"

studioPreviewAnimation(character, animation)

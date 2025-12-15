local function playForNumberLoops(animationTrack, number)
	animationTrack.Looped = true
	animationTrack:Play()
	local numberOfLoops = 0
	local connection = nil
	connection = animationTrack.DidLoop:Connect(function()
		numberOfLoops = numberOfLoops + 1
		print("loop: ", numberOfLoops)
		if numberOfLoops >= number then
			animationTrack:Stop()
			connection:Disconnect() -- it's important to disconnect connections when they are no longer needed
		end
	end)
end

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507765644"

local humanoid = script.Parent:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local animationTrack = animator:LoadAnimation(animation)

playForNumberLoops(animationTrack, 5)

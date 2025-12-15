local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer

while not localPlayer.Character do
	task.wait()
end
local character = localPlayer.Character

local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

local animation1 = Instance.new("Animation")
animation1.AnimationId = "rbxassetid://507770453"

local animation2 = Instance.new("Animation")
animation2.AnimationId = "rbxassetid://507771019"

task.wait(3) -- arbitrary wait time to allow the character to fall into place

local animationTrack1 = animator:LoadAnimation(animation1)
local animationTrack2 = animator:LoadAnimation(animation2)

animationTrack1.Priority = Enum.AnimationPriority.Movement
animationTrack2.Priority = Enum.AnimationPriority.Action

animationTrack1:Play(0.1, 5, 1)
animationTrack2:Play(10, 3, 1)

local done = false
while not done and task.wait(0.1) do
	if math.abs(animationTrack2.WeightCurrent - animationTrack2.WeightTarget) < 0.001 then
		print("got there")
		done = true
	end
end

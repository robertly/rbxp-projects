local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer

while not localPlayer.Character do
	task.wait()
end

local character = localPlayer.Character
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507770453"

local animationTrack = animator:LoadAnimation(animation)
animationTrack.Looped = false
task.wait(3)
animationTrack:Play()
task.wait(4)
animationTrack.Looped = true
animationTrack:Play()

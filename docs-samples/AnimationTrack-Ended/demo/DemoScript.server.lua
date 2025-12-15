local InsertService = game:GetService("InsertService")
local Players = game:GetService("Players")

-- Create an NPC model to animate.
local npcModel = Players:CreateHumanoidModelFromUserId(129687796)
npcModel.Name = "JoeNPC"
npcModel.Parent = workspace
npcModel:MoveTo(Vector3.new(0, 15, 4))
local humanoid = npcModel:WaitForChild("Humanoid")

-- Load an animation.
local animationModel = InsertService:LoadAsset(2510238627)
local animation = animationModel:FindFirstChildWhichIsA("Animation", true)
local animator = humanoid:WaitForChild("Animator")
local animationTrack = animator:LoadAnimation(animation)

-- Connect to Stopped event. This fires when animation stops of
-- it's own accord, or we explicitly call Stop.
animationTrack.Stopped:Connect(function()
	print("Animation stopped")
end)

-- Connect to Ended event. This fires when when animation is completely
-- finished affecting the world. In this case it will fire 3 seconds
-- after we call animationTrack:Stop because we pass in a 3
-- second fadeOut.
animationTrack.Ended:Connect(function()
	print("Animation ended")
	animationTrack:Destroy()
end)

-- Run, give it a bit to play, then stop.
print("Calling Play")
animationTrack:Play()
task.wait(10)
print("Calling Stop")
animationTrack:Stop(3)

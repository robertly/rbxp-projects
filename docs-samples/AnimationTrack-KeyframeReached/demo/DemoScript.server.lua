local Players = game:GetService("Players")

local player = Players:GetChildren()[1]
local character = workspace:WaitForChild(player.Name)
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://437855404"
local animTrack = humanoid:LoadAnimation(animation)

animTrack.KeyframeReached:Connect(function(keyframeName)
	print("Keyframe reached:" .. keyframeName)
end)
animTrack:Play()

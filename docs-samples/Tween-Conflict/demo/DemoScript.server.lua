local TweenService = game:GetService("TweenService")

local part = Instance.new("Part")
part.Position = Vector3.new(0, 10, 0)
part.Anchored = true
part.Parent = game.Workspace

local tweenInfo = TweenInfo.new(5)

-- create two conflicting tweens (both trying to animate part.Position)
local tween1 = TweenService:Create(part, tweenInfo, { Position = Vector3.new(0, 10, 20) })
local tween2 = TweenService:Create(part, tweenInfo, { Position = Vector3.new(0, 30, 0) })

-- listen for their completion status
tween1.Completed:Connect(function(playbackState)
	print("tween1: " .. tostring(playbackState))
end)
tween2.Completed:Connect(function(playbackState)
	print("tween2: " .. tostring(playbackState))
end)

-- try to play them both
tween1:Play()
tween2:Play()

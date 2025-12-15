local TweenService = game:GetService("TweenService")

local part = Instance.new("Part")
part.Position = Vector3.new(0, 10, 0)
part.Anchored = true
part.Parent = workspace

local goal = {}
goal.Orientation = Vector3.new(0, 90, 0)

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 2, true, 0.5)

local tween = TweenService:Create(part, tweenInfo, goal)

local function onPlaybackChanged()
	print("Tween status has changed to:", tween.PlaybackState)
end

local playbackChanged = tween:GetPropertyChangedSignal("PlaybackState")
playbackChanged:Connect(onPlaybackChanged)

tween:Play()

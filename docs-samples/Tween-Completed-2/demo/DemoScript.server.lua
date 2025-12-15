local TweenService = game:GetService("TweenService")

local part = Instance.new("Part")
part.Position = Vector3.new(0, 50, 0)
part.Anchored = true
part.Parent = workspace

local goal = {}
goal.Position = Vector3.new(0, 0, 0)

local tweenInfo = TweenInfo.new(3)

local tween = TweenService:Create(part, tweenInfo, goal)

local function onTweenCompleted(playbackState)
	if playbackState == Enum.PlaybackState.Completed then
		local explosion = Instance.new("Explosion")
		explosion.Position = part.Position
		explosion.Parent = workspace
		part:Destroy()
		task.delay(2, function()
			if explosion then
				explosion:Destroy()
			end
		end)
	end
end

tween.Completed:Connect(onTweenCompleted)

tween:Play()

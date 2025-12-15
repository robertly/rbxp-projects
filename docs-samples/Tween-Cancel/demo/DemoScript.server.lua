local TweenService = game:GetService("TweenService")

local part = Instance.new("Part")
part.Position = Vector3.new(0, 10, 0)
part.Anchored = true
part.Parent = workspace

local goal = {}
goal.Position = Vector3.new(0, 50, 0)

local tweenInfo = TweenInfo.new(5)

local tween = TweenService:Create(part, tweenInfo, goal)

tween:Play()
task.wait(2.5)
tween:Cancel()

local playTick = tick()
tween:Play()

tween.Completed:Wait()

local timeTaken = tick() - playTick
print("Tween took " .. tostring(timeTaken) .. " secs to complete")

-- The tween will take 5 seconds to complete as the tween variables have been reset by tween:Cancel()

local TweenService = game:GetService("TweenService")

local part = Instance.new("Part")
part.Position = Vector3.new(0, 10, 0)
part.Anchored = true
part.BrickColor = BrickColor.new("Bright green")
part.Parent = workspace

local goal = {}
goal.Position = Vector3.new(50, 10, 0)

local tweenInfo = TweenInfo.new(10, Enum.EasingStyle.Linear)

local tween = TweenService:Create(part, tweenInfo, goal)

tween:Play()

task.wait(3)
part.BrickColor = BrickColor.new("Bright red")
tween:Pause()

task.wait(2)
part.BrickColor = BrickColor.new("Bright green")
tween:Play()

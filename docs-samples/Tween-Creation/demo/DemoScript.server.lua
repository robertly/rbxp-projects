local TweenService = game:GetService("TweenService")

local part = Instance.new("Part")
part.Position = Vector3.new(0, 10, 0)
part.Color = Color3.new(1, 0, 0)
part.Anchored = true
part.Parent = game.Workspace

local goal = {}
goal.Position = Vector3.new(10, 10, 0)
goal.Color = Color3.new(0, 1, 0)

local tweenInfo = TweenInfo.new(5)

local tween = TweenService:Create(part, tweenInfo, goal)

tween:Play()

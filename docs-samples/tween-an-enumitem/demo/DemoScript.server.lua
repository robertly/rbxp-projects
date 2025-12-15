local TweenService = game:GetService("TweenService")

local part = Instance.new("Part")
part.Shape = 0
part.TopSurface = 0
part.BottomSurface = 0
part.Size = Vector3.new(1, 1, 1)
part.Position = Vector3.new(0, 100, 0)
part.Parent = workspace

local info = TweenInfo.new(5)

local propertyTable = {
	Shape = 2,
}

TweenService:Create(part, info, propertyTable):Play()

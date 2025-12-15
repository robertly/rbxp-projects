local Debris = game:GetService("Debris")

local ball = Instance.new("Part")
ball.Anchored = false
ball.Shape = Enum.PartType.Ball
ball.TopSurface = Enum.SurfaceType.Smooth
ball.BottomSurface = Enum.SurfaceType.Smooth
ball.Size = Vector3.new(1, 1, 1)

local RNG = Random.new()
local MAX_VELOCITY = 10

while true do
	local newBall = ball:Clone()
	newBall.BrickColor = BrickColor.random()
	newBall.CFrame = CFrame.new(0, 30, 0)
	newBall.Velocity =
		Vector3.new(RNG:NextNumber(-MAX_VELOCITY, MAX_VELOCITY), 0, RNG:NextNumber(-MAX_VELOCITY, MAX_VELOCITY))
	newBall.Parent = game.Workspace
	Debris:AddItem(newBall, 2)
	task.wait(0.1)
end

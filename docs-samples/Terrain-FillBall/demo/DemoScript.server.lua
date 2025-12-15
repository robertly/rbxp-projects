local Workspace = game:GetService("Workspace")

-- Creates a ball of grass at (0,0,-10) with a radius of 10 studs
Workspace.Terrain:FillBall(Vector3.new(0, 0, -10), 10, Enum.Material.Grass)

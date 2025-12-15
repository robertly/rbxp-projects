local Players = game:GetService("Players")

local player = Players.LocalPlayer

local mouse = player:GetMouse()
local camera = workspace.CurrentCamera

--This will create a cube facing centered at the origin of the [[Ray]] returned and facing in the same direction. The center of the cube will be one stud in front of the camera.
mouse.Button1Down:Connect(function()
	local ray = camera:ScreenPointToRay(mouse.X, mouse.Y, 1)
	local cube = Instance.new("Part")
	cube.Size = Vector3.new(1, 1, 1)
	cube.CFrame = CFrame.new(ray.Origin, ray.Origin + ray.Direction)
	cube.Anchored = true
	cube.Parent = workspace
end)

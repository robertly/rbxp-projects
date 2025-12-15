local Players = game:GetService("Players")

local player = Players.LocalPlayer

local mouse = player:GetMouse()

local point
local down

local function selectPart()
	if mouse.Target and not mouse.Target.Locked then
		point = mouse.Target
		mouse.TargetFilter = point
		down = true
	end
end

local function movePart()
	if down and point then
		local posX, posY, posZ = mouse.Hit.X, mouse.Hit.Y, mouse.Hit.Z
		point.Position = Vector3.new(posX, posY, posZ)
	end
end

local function deselectPart()
	down = false
	point = nil
	mouse.TargetFilter = nil
end

mouse.Button1Down:Connect(selectPart)
mouse.Button1Up:Connect(deselectPart)
mouse.Move:Connect(movePart)

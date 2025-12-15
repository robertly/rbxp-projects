local Players = game:GetService("Players")

local player = Players.LocalPlayer

local mouse = player:GetMouse()

local surfaceTypes = {
	Enum.SurfaceType.Smooth,
	Enum.SurfaceType.Glue,
	Enum.SurfaceType.Weld,
	Enum.SurfaceType.Studs,
	Enum.SurfaceType.Inlet,
	Enum.SurfaceType.Universal,
	Enum.SurfaceType.Hinge,
	Enum.SurfaceType.Motor,
}

local function onMouseClick()
	-- make sure the mouse is pointing at a part
	local target = mouse.Target
	if not target then
		return
	end

	local surfaceType = surfaceTypes[math.random(1, #surfaceTypes)]

	local surface = mouse.TargetSurface
	local propertyName = surface.Name .. "Surface"

	mouse.Target[propertyName] = surfaceType
end

mouse.Button1Down:Connect(onMouseClick)

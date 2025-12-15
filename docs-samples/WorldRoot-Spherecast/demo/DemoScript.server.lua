local Workspace = game:GetService("Workspace")

local function castSphere()
	-- The initial position of the cast spherical shape
	local originPosition = Vector3.new(0, 50, 0)
	-- The radius of the cast spherical shape in studs
	local radius = 10
	-- The direction the sphere is cast in
	local direction = -Vector3.yAxis
	-- The maximum distance of the cast
	local distance = 50

	-- Cast the sphere and create a visualization of it
	local raycastResult = Workspace:Spherecast(originPosition, radius, direction * distance)

	if raycastResult then
		-- Print all properties of the RaycastResult if it exists
		print(`Sphere intersected with: {raycastResult.Instance:GetFullName()}`)
		print(`Intersection position: {raycastResult.Position}`)
		print(`Distance between sphere's initial position and result: {raycastResult.Distance}`)
		print(`The normal vector of the intersected face: {raycastResult.Normal}`)
		print(`Material hit: {raycastResult.Material.Name}`)
	else
		print("Nothing was hit")
	end
end

-- Continually cast a sphere every 2 seconds
while true do
	castSphere()
	task.wait(2)
end

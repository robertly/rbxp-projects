local Workspace = game:GetService("Workspace")

local function castRay()
	-- The origin point of the ray
	local originPosition = Vector3.new(0, 50, 0)
	-- The direction the ray is cast in
	local direction = -Vector3.yAxis
	-- The maximum distance of the ray
	local distance = 50

	-- Cast the ray and create a visualization of it
	local raycastResult = Workspace:Raycast(originPosition, direction * distance)

	if raycastResult then
		-- Print all properties of the RaycastResult if it exists
		print(`Ray intersected with: {raycastResult.Instance:GetFullName()}`)
		print(`Intersection position: {raycastResult.Position}`)
		print(`Distance between ray origin and result: {raycastResult.Distance}`)
		print(`The normal vector of the intersected face: {raycastResult.Normal}`)
		print(`Material hit: {raycastResult.Material.Name}`)
	else
		print("Nothing was hit")
	end
end

-- Continually cast a ray every 2 seconds
while true do
	castRay()
	task.wait(2)
end

local Workspace = game:GetService("Workspace")

local function castBlock()
	-- The initial position and rotation of the cast block shape
	local originCFrame = CFrame.new(Vector3.new(0, 50, 0))
	-- The size of the cast block shape
	local size = Vector3.new(6, 3, 9)
	-- The direction the block is cast in
	local direction = -Vector3.yAxis
	-- The maximum distance of the cast
	local distance = 50

	-- Cast the block and create a visualization of it
	local raycastResult = Workspace:Blockcast(originCFrame, size, direction * distance)

	if raycastResult then
		-- Print all properties of the RaycastResult if it exists
		print(`Block intersected with: {raycastResult.Instance:GetFullName()}`)
		print(`Intersection position: {raycastResult.Position}`)
		print(`Distance between block's initial position and result: {raycastResult.Distance}`)
		print(`The normal vector of the intersected face: {raycastResult.Normal}`)
		print(`Material hit: {raycastResult.Material.Name}`)
	else
		print("Nothing was hit")
	end
end

-- Continually cast a block every 2 seconds
while true do
	castBlock()
	task.wait(2)
end

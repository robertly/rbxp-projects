local Workspace = game:GetService("Workspace")
local PathfindingService = game:GetService("PathfindingService")

-- This model contains a start, end and three paths between the player can walk on: Snow, Metal and LeafyGrass
local PathOptionsModel = script.Parent.PathOptions
local startPosition = PathOptionsModel.Start.Position
local finishPosition = PathOptionsModel.End.Position

-- Create a path that avoids Snow and Metal materials
-- This will ensure the path created avoids the Snow and Metal paths and guides
-- the user towards the LeafyGrass path
local path = PathfindingService:CreatePath({
	AgentRadius = 3,
	AgentHeight = 6,
	AgentCanJump = false,
	Costs = {
		Snow = math.huge,
		Metal = math.huge,
	},
})

-- Compute the path
local success, errorMessage = pcall(function()
	path:ComputeAsync(startPosition, finishPosition)
end)

-- Confirm the computation was successful
if success and path.Status == Enum.PathStatus.Success then
	-- For each waypoint, create a part to visualize the path
	for _, waypoint in path:GetWaypoints() do
		local part = Instance.new("Part")
		part.Position = waypoint.Position
		part.Size = Vector3.new(0.5, 0.5, 0.5)
		part.Color = Color3.new(1, 0, 1)
		part.Anchored = true
		part.CanCollide = false
		part.Parent = Workspace
	end
else
	print(`Path unable to be computed, error: {errorMessage}`)
end

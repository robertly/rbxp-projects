local PathfindingService = game:GetService("PathfindingService")

local path = PathfindingService:CreatePath()

local PATH_START = Vector3.new(0, 1, 0)
local PATH_END = Vector3.new(100, 1, 25)

path:ComputeAsync(PATH_START, PATH_END)

if path.Status == Enum.PathStatus.Success then
	local waypoints = path:GetWaypoints()
	for _, waypoint in pairs(waypoints) do
		print(waypoint.Position)
	end
end

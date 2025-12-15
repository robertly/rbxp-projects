local PathfindingService = game:GetService("PathfindingService")

local agentParams = {
	AgentRadius = 2.0,
	AgentHeight = 5.0,
	AgentCanJump = false,
}
local currentWaypointIdx = 1

local path = PathfindingService:CreatePath(agentParams)

local humanoidRootPart = script.Parent:FindFirstChild("HumanoidRootPart")
local targetPosition = Vector3.new(50, 0, 50)
path:ComputeAsync(humanoidRootPart.Position, targetPosition)

-- When the path is blocked...
local function OnPathBlocked(blockedWaypointIdx)
	-- Check if the obstacle is further down the path
	if blockedWaypointIdx > currentWaypointIdx then
		-- Recompute the path
		path:ComputeAsync(humanoidRootPart.Position, targetPosition)
		if path.Status == Enum.PathStatus.Success then
			-- Retrieve update waypoint list with path:GetWaypoints()
			-- and Continue walking towards target
			print("Found a new path!")
		else
			-- Error, path not found
			warn("Unable to find path - status: " .. tostring(path.Status))
		end
	end
end

path.Blocked:Connect(OnPathBlocked)

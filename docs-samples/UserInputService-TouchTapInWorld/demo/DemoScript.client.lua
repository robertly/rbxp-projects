local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local camera = Workspace.CurrentCamera
local LENGTH = 500

local function createPart(position, processedByUI)
	-- Do not create a part if the player clicked on a GUI/UI element
	if processedByUI then
		return
	end

	-- Get Vector3 world position from the Vector2 viewport position
	local unitRay = camera:ViewportPointToRay(position.X, position.Y)
	local result = Workspace:Raycast(unitRay.Origin, unitRay.Direction * LENGTH)
	if not result then
		return
	end

	local hitPart = result.Instance
	local worldPosition = result.Position

	-- Create a new part at the world position if the player clicked on a part
	-- Do not create a new part if player clicks on empty skybox
	if hitPart then
		local part = Instance.new("Part")
		part.Anchored = true
		part.Size = Vector3.new(1, 1, 1)
		part.Position = worldPosition
		part.Parent = Workspace
	end
end

UserInputService.TouchTapInWorld:Connect(createPart)

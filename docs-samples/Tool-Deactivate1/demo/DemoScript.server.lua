local ContextActionService = game:GetService("ContextActionService")

local tool = script.Parent

-- Gives Handle within Tool a random BrickColor
local function toolDeactivated()
	tool.Handle.BrickColor = BrickColor.random()
end

-- Deactivates the tool when any key is pressed down
local function keyPressed(_actionName, actionInputState, _actionInputObject)
	if actionInputState == Enum.UserInputState.Begin then
		tool:Deactivate()
	end
end

tool.Deactivated:Connect(toolDeactivated)
ContextActionService:BindAction("deactivateTool", keyPressed, true, "x")

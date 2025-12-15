local ContextActionService = game:GetService("ContextActionService")

local ACTION_RELOAD = "Reload"

local tool = script.Parent

local function handleAction(actionName, inputState, _inputObject)
	if actionName == ACTION_RELOAD and inputState == Enum.UserInputState.Begin then
		print("Reloading!")
	end
end

tool.Equipped:Connect(function()
	ContextActionService:BindAction(ACTION_RELOAD, handleAction, true, Enum.KeyCode.R)
end)

tool.Unequipped:Connect(function()
	ContextActionService:UnbindAction(ACTION_RELOAD)
end)

local ContextActionService = game:GetService("ContextActionService")

local function handleAction(actionName, inputState, inputObj)
	if inputState == Enum.UserInputState.Begin then
		print("Handling action: " .. actionName)
		print(inputObj.UserInputType)
	end

	-- Since this function does not return anything, this handler will
	-- "sink" the input and no other action handlers will be called after
	-- this one.
end

ContextActionService:BindAction("BoundAction", handleAction, false, Enum.KeyCode.F)

local ContextActionService = game:GetService("ContextActionService")

-- Define an action handler for FirstAction
local function actionHandlerOne(actionName, inputState, _inputObj)
	if inputState == Enum.UserInputState.Begin then
		print("Action Handler One: " .. actionName)
	end
	-- This action handler returns nil, so it is assumed that
	-- it properly handles the action.
end

-- Binding the action FirstAction (it's on the bottom of the stack)
ContextActionService:BindAction("FirstAction", actionHandlerOne, false, Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C)

-- Define an action handler for SecondAction
local function actionHandlerTwo(actionName, inputState, inputObj)
	if inputState == Enum.UserInputState.Begin then
		print("Action Handler Two: " .. actionName)
	end

	if inputObj.KeyCode == Enum.KeyCode.X then
		return Enum.ContextActionResult.Pass
	else
		-- Returning nil implicitly Sinks inputs
		return Enum.ContextActionResult.Sink
	end
end

-- Binding SecondAction over the first action (since it bound more recently, it is on the top of the stack)
-- Note that SecondAction uses the same keys as
ContextActionService:BindAction("SecondAction", actionHandlerTwo, false, Enum.KeyCode.Z, Enum.KeyCode.X)

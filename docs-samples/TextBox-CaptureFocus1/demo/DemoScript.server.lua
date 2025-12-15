local ContextActionService = game:GetService("ContextActionService")

local ACTION_NAME = "FocusTheTextBox"

local textBox = script.Parent

local function handleAction(actionName, inputState, _inputObject)
	if actionName == ACTION_NAME and inputState == Enum.UserInputState.Begin then
		textBox:CaptureFocus()
	end
end

ContextActionService:BindAction(ACTION_NAME, handleAction, false, Enum.KeyCode.Q)

local ContextActionService = game:GetService("ContextActionService")

local ACTION_INSPECT = "Inspect"
local INPUT_INSPECT = Enum.KeyCode.E
local IMAGE_INSPECT = "rbxassetid://1826746856" -- Image of a speech bubble with ? in it

local function handleAction(actionName, inputState, _inputObject)
	if actionName == ACTION_INSPECT and inputState == Enum.UserInputState.End then
		print("Inspecting")
	end
end

-- For touch devices, a button is created on-screen automatically via the 3rd parameter
ContextActionService:BindAction(ACTION_INSPECT, handleAction, true, INPUT_INSPECT)
-- We can use these functions to customize the button:
ContextActionService:SetImage(ACTION_INSPECT, IMAGE_INSPECT)
ContextActionService:SetTitle(ACTION_INSPECT, "Look")
ContextActionService:SetDescription(ACTION_INSPECT, "Inspect something.")
ContextActionService:SetPosition(ACTION_INSPECT, UDim2.new(0, 0, 0, 0))
-- We can manipulate the button directly using ContextActionService:GetButton
local imgButton = ContextActionService:GetButton(ACTION_INSPECT)
if imgButton then -- Remember: non-touch devices won't return anything!
	imgButton.ImageColor3 = Color3.new(0.5, 1, 0.5) -- Tint the ImageButton green
end

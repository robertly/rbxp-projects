local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local mouse = player:GetMouse()

local events = {
	"Button1Down",
	"Button1Up",
	"Button2Down",
	"Button2Up",
	"Idle",
	"Move",
	"WheelBackward",
	"WheelForward",
	"KeyDown",
	"KeyUp",
}

local currentEvent
local frame = 0

local function processInput()
	frame = frame + 1
	print("Frame", frame, "- mouse event was passed to", currentEvent)
end

for _, event in pairs(events) do
	mouse[event]:Connect(function()
		currentEvent = event
	end)
end

RunService:BindToRenderStep("ProcessInput", Enum.RenderPriority.Input.Value, processInput)

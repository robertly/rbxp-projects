local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.CharacterAdded:Wait()
local head = character:WaitForChild("Head", false)

local mouse = player:GetMouse()

local zoomed = false
local camera = game.Workspace.CurrentCamera
local target = nil
local originalProperties = {
	FieldOfView = nil,
	_CFrame = nil,
	MouseBehavior = nil,
	MouseDeltaSensitivity = nil,
}

local AngleX, TargetAngleX = 0, 0
local AngleY, TargetAngleY = 0, 0

-- Reset camera back to CFrame and FieldOfView before zoom
local function ResetCamera()
	target = nil
	camera.CameraType = Enum.CameraType.Custom
	camera.CFrame = originalProperties._CFrame
	camera.FieldOfView = originalProperties.FieldOfView

	UserInputService.MouseBehavior = originalProperties.MouseBehavior
	UserInputService.MouseDeltaSensitivity = originalProperties.MouseDeltaSensitivity
end

local function ZoomCamera()
	-- Allow camera to be changed by script
	camera.CameraType = Enum.CameraType.Scriptable

	-- Store camera properties before zoom
	originalProperties._CFrame = camera.CFrame
	originalProperties.FieldOfView = camera.FieldOfView
	originalProperties.MouseBehavior = UserInputService.MouseBehavior
	originalProperties.MouseDeltaSensitivity = UserInputService.MouseDeltaSensitivity

	-- Zoom camera
	target = mouse.Hit.Position
	local eyesight = head.Position
	camera.CFrame = CFrame.new(eyesight, target)
	camera.Focus = CFrame.new(target)
	camera.FieldOfView = 10

	-- Lock and slow down mouse
	UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
	UserInputService.MouseDeltaSensitivity = 1

	-- Reset zoom angles
	AngleX, TargetAngleX = 0, 0
	AngleY, TargetAngleY = 0, 0
end

-- Toggle camera zoom/unzoom
local function MouseClick()
	if zoomed then
		-- Unzoom camera
		ResetCamera()
	else
		-- Zoom in camera
		ZoomCamera()
	end

	zoomed = not zoomed
end

local function MouseMoved(input)
	if zoomed then
		local sensitivity = 0.6 -- anything higher would make looking up and down harder; recommend anything between 0~1
		local smoothness = 0.05 -- recommend anything between 0~1

		local delta = Vector2.new(input.Delta.x / sensitivity, input.Delta.y / sensitivity) * smoothness

		local X = TargetAngleX - delta.y
		local Y = TargetAngleY - delta.x
		TargetAngleX = (X >= 80 and 80) or (X <= -80 and -80) or X
		TargetAngleY = (Y >= 80 and 80) or (Y <= -80 and -80) or Y

		AngleX = AngleX + (TargetAngleX - AngleX) * 0.35
		AngleY = AngleY + (TargetAngleY - AngleY) * 0.15

		camera.CFrame = CFrame.new(head.Position, target)
			* CFrame.Angles(0, math.rad(AngleY), 0)
			* CFrame.Angles(math.rad(AngleX), 0, 0)
	end
end

local function InputBegan(input, _gameProcessedEvent)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		MouseClick()
	end
end

local function InputChanged(input, _gameProcessedEvent)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		MouseMoved(input)
	end
end

if UserInputService.MouseEnabled then
	UserInputService.InputBegan:Connect(InputBegan)
	UserInputService.InputChanged:Connect(InputChanged)
end

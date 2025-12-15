local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.CharacterAdded:Wait()
local head = character:WaitForChild("Head")

local camera = workspace.CurrentCamera
local currentRotation = camera.CFrame -- CFrame.new(Vector3.new(0,0,0), Vector3.new(0,0,0))
local lastInputFrame = nil
local upsideDown = false

task.wait()

local orientationSet = false
local function GravityChanged(gravity)
	if not orientationSet then
		upsideDown = (gravity.Position.X < -0.5 or gravity.Position.Z > 0.5)

		orientationSet = true
	end
end

local function RotationChanged(_rotation, rotCFrame)
	if orientationSet then
		if not lastInputFrame then
			lastInputFrame = rotCFrame
		end

		local delta = rotCFrame * lastInputFrame:inverse()
		local x, y, z = delta:ToEulerAnglesXYZ()
		if upsideDown then
			delta = CFrame.Angles(-x, y, z)
		else
			delta = CFrame.Angles(x, -y, z)
		end
		currentRotation = currentRotation * delta

		lastInputFrame = rotCFrame
	end
end

local function HideCharacter()
	for _, limb in pairs(character:GetChildren()) do
		if limb:IsA("Part") then
			limb.Transparency = 1
		end
	end
end

if UserInputService.GyroscopeEnabled then
	UserInputService.DeviceGravityChanged:Connect(GravityChanged)
	UserInputService.DeviceRotationChanged:Connect(RotationChanged)

	HideCharacter()

	RunService:BindToRenderStep("Camera", Enum.RenderPriority.Camera.Value, function()
		camera.CFrame = CFrame.new(head.Position - Vector3.new(0, 8, 10)) * currentRotation
		camera.Focus = CFrame.new(currentRotation * Vector3.new(0, 0, -10))
	end)
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local OFFSET = Vector3.new(20, 20, 20)

local player = Players.LocalPlayer

local camera = workspace.CurrentCamera

-- Detatch the character's rotation from the camera
UserSettings().GameSettings.RotationType = Enum.RotationType.MovementRelative

local function onRenderStep()
	local character = player.Character
	if character then
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then
			-- Update the position of the camera
			local playerPosition = humanoidRootPart.Position
			local cameraPosition = playerPosition + OFFSET
			camera.CFrame = CFrame.new(cameraPosition, playerPosition)

			-- Update the focus of the camera to follow the character
			camera.Focus = humanoidRootPart.CFrame
		end
	end
end

RunService:BindToRenderStep("Camera", Enum.RenderPriority.Camera.Value, onRenderStep)

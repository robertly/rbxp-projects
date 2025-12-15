local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local mouse = player:GetMouse()

local beam = Instance.new("Beam")
beam.Segments = 1
beam.Width0 = 0.2
beam.Width1 = 0.2
beam.Color = ColorSequence.new(Color3.new(1, 0, 0))
beam.FaceCamera = true

local attachment0 = Instance.new("Attachment")
local attachment1 = Instance.new("Attachment")
beam.Attachment0 = attachment0
beam.Attachment1 = attachment1

beam.Parent = workspace.Terrain
attachment0.Parent = workspace.Terrain
attachment1.Parent = workspace.Terrain

local function onRenderStep()
	local character = player.Character
	if not character then
		beam.Enabled = false
		return
	end

	local head = character:FindFirstChild("Head")
	if not head then
		beam.Enabled = false
		return
	end

	beam.Enabled = true

	local origin = head.Position
	local finish = mouse.Hit.Position

	attachment0.Position = origin
	attachment1.Position = finish
end

RunService.RenderStepped:Connect(onRenderStep)

local Players = game:GetService("Players")

local POWER = 30

local bpos = Instance.new("BodyPosition")
local gyro = Instance.new("BodyGyro")

local fly = false
local tool = nil

local player = Players.LocalPlayer

local character = player.Character
if not character or not character.Parent then
	character = player.CharacterAdded:Wait()
end

local char = character:WaitForChild("HumanoidRootPart")

local mouse = player:GetMouse()

local function setupTool()
	tool = Instance.new("Tool")
	tool.Name = "Fly"
	tool.RequiresHandle = false
	tool.Parent = player.Backpack

	gyro.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bpos.maxForce = Vector3.new(math.huge, math.huge, math.huge)

	tool.Parent = player.Backpack
end

setupTool()

local function onSelected()
	bpos.Parent = char
	bpos.position = char.Position + Vector3.new(0, 10, 0)
	gyro.Parent = char

	character.Humanoid.PlatformStand = true

	for _, v in ipairs(char:GetChildren()) do
		if v.ClassName == "Motor" then
			v.MaxVelocity = 0
			v.CurrentAngle = -1
			if v.Name == "Left Hip" then
				v.CurrentAngle = 1
			end
		end
	end

	fly = true
	task.wait()
	while fly do
		local pos = mouse.Hit.Position
		gyro.CFrame = CFrame.new(char.Position, pos) * CFrame.fromEulerAnglesXYZ(-3.14 / 2, 0, 0)
		bpos.Position = char.Position + (pos - char.Position).Unit * POWER
		task.wait()
	end
end

function onDeselected()
	gyro.Parent = nil
	fly = false

	character.Humanoid.PlatformStand = false

	for _, v in ipairs(char:GetChildren()) do
		if v.ClassName == "Motor" then
			v.MaxVelocity = 1
		end
	end

	bpos.Parent = nil
end

tool.Unequipped:Connect(function()
	fly = false
end)

tool.Activated:Connect(onSelected)
tool.Deactivated:Connect(onDeselected)

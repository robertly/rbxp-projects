local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

function playCutscene(character)
	local primaryPart = character.PrimaryPart

	camera.CameraType = Enum.CameraType.Scriptable

	local baseCFrame = primaryPart.CFrame * CFrame.new(0, 0, -100) * CFrame.Angles(0, math.pi, 0)
	local targetCFrame = primaryPart.CFrame * CFrame.new(0, 0, -10) * CFrame.Angles(0, math.pi, 0)

	camera.CFrame = baseCFrame

	local tween = TweenService:Create(camera, TweenInfo.new(2), { CFrame = targetCFrame })

	tween:Play()
	tween.Completed:Wait()
	camera.CameraType = Enum.CameraType.Custom
end

localPlayer.CharacterAdded:Connect(function(character)
	task.wait(3)
	playCutscene(character)
end)

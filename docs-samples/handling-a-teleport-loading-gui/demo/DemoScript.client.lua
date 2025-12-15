local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

local customLoadingScreen = TeleportService:GetArrivingTeleportGui()
if customLoadingScreen then
	local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
	ReplicatedFirst:RemoveDefaultLoadingScreen()
	customLoadingScreen.Parent = playerGui
	task.wait(5)
	customLoadingScreen:Destroy()
end

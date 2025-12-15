local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local PLACE_ID = 0 -- replace here
local loadingGui = ReplicatedStorage:FindFirstChild("LoadingGui")

-- parent the loading gui for this place
loadingGui.Parent = playerGui

-- set the loading gui for the destination place
TeleportService:SetTeleportGui(loadingGui)

TeleportService:Teleport(PLACE_ID)

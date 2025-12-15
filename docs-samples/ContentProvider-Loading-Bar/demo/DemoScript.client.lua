local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- create a basic loading bar
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.1, 0)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = screenGui

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.Position = UDim2.new(0, 0, 0, 0)
bar.BackgroundColor3 = Color3.new(0, 0, 1)
bar.Parent = frame

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
local sound2 = Instance.new("Sound")
sound2.SoundId = "rbxassetid://9120385974"

local assets = {
	sound,
	sound2,
}

task.wait(3)

for i = 1, #assets do
	local asset = assets[i]
	ContentProvider:PreloadAsync({ asset }) -- 1 at a time, yields
	local progress = i / #assets
	bar.Size = UDim2.new(progress, 0, 1, 0)
end

print("loading done")

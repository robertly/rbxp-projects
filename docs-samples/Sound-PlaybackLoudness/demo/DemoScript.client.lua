-- to be placed in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")

-- wait for local player PlayerGui
local LocalPlayer = Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")

-- create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- create a holder for our bar
local frame = Instance.new("Frame")
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.Size = UDim2.new(0.3, 0, 0.05, 0)
frame.Parent = screenGui

-- create a bar
local bar = Instance.new("Frame")
bar.Position = UDim2.new(0, 0, 0, 0)
bar.Size = UDim2.new(1, 0, 1, 0)
bar.BackgroundColor3 = Color3.new(0, 1, 0)
bar.Parent = frame

-- create a sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.Looped = true
sound.Parent = screenGui
sound:Play()

-- define a max loudness
local maxLoudness = 30

-- animate the amplitude bar
while true do
	local amplitude = math.clamp(sound.PlaybackLoudness / maxLoudness, 0, 1)
	bar.Size = UDim2.new(amplitude, 0, 1, 0)
	wait(0.05)
end

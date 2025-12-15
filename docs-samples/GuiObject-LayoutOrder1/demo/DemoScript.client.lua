local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer

local playerGui = localPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local uiGridLayout = Instance.new("UIGridLayout")
uiGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiGridLayout.Parent = screenGui

local function createImage(color)
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Image = "rbxassetid://924320031"
	imageLabel.ImageColor3 = color
	imageLabel.Parent = screenGui
	return imageLabel
end

local firstImageLabel = createImage(Color3.fromRGB(255, 0, 0))
local secondImageLabel = createImage(Color3.fromRGB(0, 255, 0))
local thirdImageLabel = createImage(Color3.fromRGB(0, 0, 255))

task.wait(3) -- wait time to show change in LayoutOrder

firstImageLabel.LayoutOrder = 3
secondImageLabel.LayoutOrder = 1
thirdImageLabel.LayoutOrder = 2

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screen = Instance.new("ScreenGui")
screen.Parent = playerGui

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
scrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
scrollingFrame.Size = UDim2.new(0, 412, 0, 300)
scrollingFrame.Parent = screen

local grid = Instance.new("UIGridLayout")
grid.CellPadding = UDim2.new(0, 0, 0, 0)
grid.CellSize = UDim2.new(0, 100, 0, 100)
grid.Parent = scrollingFrame

local function onContentSizeChanged()
	local absoluteSize = grid.AbsoluteContentSize
	scrollingFrame.CanvasSize = UDim2.new(0, absoluteSize.X, 0, absoluteSize.Y)
end

grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(onContentSizeChanged)

for x = 1, 10 do
	for y = 1, 4 do
		local button = Instance.new("TextButton")
		button.Text = x .. ", " .. y
		button.Parent = scrollingFrame
	end
end

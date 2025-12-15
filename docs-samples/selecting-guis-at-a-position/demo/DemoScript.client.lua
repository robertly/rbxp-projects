local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")

-- Create a Folder and ScreenGui to contain the highlight Frames
local highlights = Instance.new("Folder")
highlights.Name = "Highlights"
highlights.Parent = playerGui

local highlightsContainer = Instance.new("ScreenGui")
highlightsContainer.Name = "Container"
highlightsContainer.Parent = highlights
highlightsContainer.DisplayOrder = 99999

-- Creates a semi-transparent yellow Frame on top of the gui with the same AbsoluteSize and AbsolutePosition
local function highlightAsFrame(gui)
	local highlight = Instance.new("Frame")
	highlight.Name = "Highlight"
	highlight.Parent = highlightsContainer
	highlight.Size = UDim2.new(0, gui.AbsoluteSize.X, 0, gui.AbsoluteSize.Y)
	highlight.Position = UDim2.new(0, gui.AbsolutePosition.X, 0, gui.AbsolutePosition.Y)
	highlight.BackgroundColor3 = Color3.fromRGB(255, 255, 10) -- Yellow
	highlight.BackgroundTransparency = 0.75
	highlight.BorderSizePixel = 0
	highlight.LayoutOrder = gui.LayoutOrder - 1
end

-- Use GetGuiObjectsAtPosition to get and highlight all GuiObjects at the input's position
local function highlightGui(input, _gameProcessed)
	local pos = input.Position
	local guisAtPosition = playerGui:GetGuiObjectsAtPosition(pos.X, pos.Y)

	highlightsContainer:ClearAllChildren()

	for _, gui in ipairs(guisAtPosition) do
		if gui:IsA("GuiObject") then
			highlightAsFrame(gui)
		end
	end
end

-- Fire highlightGui on InputBegan if input is of type MouseButton1 of Touch
local function InputBegan(input, gameProcessed)
	local inputType = input.UserInputType
	local touch = Enum.UserInputType.Touch
	local mouse1 = Enum.UserInputType.MouseButton1
	if inputType == touch or inputType == mouse1 then
		highlightGui(input, gameProcessed)
	end
end

UserInputService.InputBegan:Connect(InputBegan)

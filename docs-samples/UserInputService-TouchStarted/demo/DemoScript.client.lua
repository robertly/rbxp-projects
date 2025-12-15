local UserInputService = game:GetService("UserInputService")

local dragging
local dragInput
local dragStart
local startPos

local gui = script.Parent

local function touchStarted(input, _gameProcessed)
	if not dragging then
		dragging = true
		dragInput = input
		dragStart = input.Position
		startPos = gui.Position
	end
end

local function update(input, _gameProcessed)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		gui.Position =
			UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end

local function touchEnded(input, _gameProcessed)
	if input == dragInput then
		dragging = false
	end
end

UserInputService.TouchStarted:Connect(touchStarted)
UserInputService.TouchMoved:Connect(update)
UserInputService.TouchEnded:Connect(touchEnded)

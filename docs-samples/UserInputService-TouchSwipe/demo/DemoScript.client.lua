local UserInputService = game:GetService("UserInputService")

local gui = script.Parent
local swipePositionY = gui.Position.Y.Offset
local swipePositionX = gui.Position.X.Offset

local camera = workspace.CurrentCamera
local maxY = camera.ViewportSize.Y - gui.Size.Y.Offset
local maxX = camera.ViewportSize.X - gui.Size.X.Offset

local function TouchSwipe(swipeDirection, _numberOfTouches, _gameProcessedEvent)
	if swipeDirection == Enum.SwipeDirection.Up then
		swipePositionY = math.max(swipePositionY - 200, 0)
	elseif swipeDirection == Enum.SwipeDirection.Down then
		swipePositionY = math.min(swipePositionY + 200, maxY)
	elseif swipeDirection == Enum.SwipeDirection.Left then
		swipePositionX = math.max(swipePositionX - 200, 0)
	elseif swipeDirection == Enum.SwipeDirection.Right then
		swipePositionX = math.min(swipePositionX + 200, maxX)
	end

	gui:TweenPosition(UDim2.new(0, swipePositionX, 0, swipePositionY), "Out", "Quad", 0.25, true)
end

UserInputService.TouchSwipe:Connect(TouchSwipe)

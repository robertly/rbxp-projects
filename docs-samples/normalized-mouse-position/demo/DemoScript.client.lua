local Players = game:GetService("Players")

-- Note: You should use ContextActionService or UserInputService instead of
-- the Mouse object for accomplishing this task.
local player = Players.LocalPlayer
local mouse = player:GetMouse()

local function onMouseMove()
	-- Construct Vector2 objects for the mouse's position and screen size
	local position = Vector2.new(mouse.X, mouse.Y)
	local size = Vector2.new(mouse.ViewSizeX, mouse.ViewSizeY)
	-- A normalized position will map the top left (just under the topbar)
	-- to (0, 0) the bottom right to (1, 1), and the center to (0.5, 0.5).
	-- This is calculated by dividing the position by the total size.
	local normalizedPosition = position / size
	print(normalizedPosition)
end
mouse.Move:Connect(onMouseMove)

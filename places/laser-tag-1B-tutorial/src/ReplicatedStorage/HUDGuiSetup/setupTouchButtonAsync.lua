--[[
	Sets up a touch button for blasting if the local player is on a device that supports touch.

	Toggles the visibility of the button based on their last input type.
--]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer

local TOUCH_BUTTON_SIZE_RATIO_TO_JUMP_BUTTON = 0.75

local function setupTouchButtonAsync(gui: ScreenGui)
	local blastButton = gui.BlastButton

	-- TouchEnabled only needs to be read once. If this device doesn't support touch input,
	-- then we don't need to do anything.
	if not UserInputService.TouchEnabled then
		return
	end

	-- Since touch is supported, set up the a touch button for firing the blaster.
	-- Base the size and position of our blast button off of the default jump button, which can differ by device

	-- Wait for Roblox core scripts to add the default JumpButton
	local jumpButton =
		localPlayer.PlayerGui:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")

	local function updateTouchButtonSizeAndPosition()
		local scaledTouchButtonSize = UDim2.fromOffset(
			jumpButton.AbsoluteSize.X * TOUCH_BUTTON_SIZE_RATIO_TO_JUMP_BUTTON,
			jumpButton.AbsoluteSize.Y * TOUCH_BUTTON_SIZE_RATIO_TO_JUMP_BUTTON
		)

		blastButton.Size = scaledTouchButtonSize
		blastButton.Position = jumpButton.Position + UDim2.fromOffset(jumpButton.AbsoluteSize.X, 0)
	end
	jumpButton:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateTouchButtonSizeAndPosition)
	jumpButton:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateTouchButtonSizeAndPosition)
	updateTouchButtonSizeAndPosition()

	-- Only show the touch button when user is using touch input
	local function updateTouchVisibility()
		local lastInputType = UserInputService:GetLastInputType()
		local isTouchInput = lastInputType == Enum.UserInputType.Touch
		blastButton.Visible = isTouchInput
	end
	UserInputService.LastInputTypeChanged:Connect(updateTouchVisibility)
	updateTouchVisibility()
end

return setupTouchButtonAsync

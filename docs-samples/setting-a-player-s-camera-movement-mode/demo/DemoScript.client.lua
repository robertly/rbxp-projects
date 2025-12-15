local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Set the player's camera movement mode on mobile devices to classic
player.DevTouchCameraMovementMode = Enum.DevTouchCameraMovementMode.Classic

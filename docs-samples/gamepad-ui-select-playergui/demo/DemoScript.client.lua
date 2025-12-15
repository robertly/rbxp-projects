local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local screenGui = PlayerGui:WaitForChild("ScreenGui")
local startSelection = screenGui:WaitForChild("StartSelection")

-- select the best button on the screen when the StartSelection button is activated
startSelection.Activated:Connect(function()
	GuiService:Select(PlayerGui)
end)

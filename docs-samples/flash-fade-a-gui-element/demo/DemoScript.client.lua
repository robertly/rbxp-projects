local RunService = game:GetService("RunService")

local MIN_TRANSPARENCY = 0
local MAX_TRANSPARENCY = 0.9
local delta = 0

local function fadeGui()
	local element = script.Parent

	if element.BackgroundTransparency <= MIN_TRANSPARENCY then
		delta = 0.01
	elseif element.BackgroundTransparency >= MAX_TRANSPARENCY then
		delta = -0.01
	end

	element.BackgroundTransparency = element.BackgroundTransparency + delta
end

RunService.RenderStepped:Connect(fadeGui)

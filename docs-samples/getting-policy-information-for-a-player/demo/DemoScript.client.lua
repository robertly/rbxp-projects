local PolicyService = game:GetService("PolicyService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local success, result = pcall(function()
	return PolicyService:GetPolicyInfoForPlayerAsync(player)
end)

if not success then
	warn("PolicyService error: " .. result)
elseif result.ArePaidRandomItemsRestricted then
	warn("Player cannot interact with paid random item generators")
end

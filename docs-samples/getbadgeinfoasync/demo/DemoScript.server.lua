local BadgeService = game:GetService("BadgeService")

-- Fetch badge information
local success, result = pcall(function()
	return BadgeService:GetBadgeInfoAsync(00000000) -- Change this to desired badge ID
end)

-- Output the information
if success then
	print("Badge:", result.Name)
	print("Enabled:", result.IsEnabled)
	print("Description:", result.Description)
	print("Icon:", "rbxassetid://" .. result.IconImageId)
else
	warn("Error while fetching badge info:", result)
end

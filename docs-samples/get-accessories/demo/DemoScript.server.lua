local includeRigidAccessories = true
local accessoriesTable =
	game:GetService("Players"):GetHumanoidDescriptionFromUserId(1):GetAccessories(includeRigidAccessories)
for _, accessoryInfo in ipairs(accessoriesTable) do
	print(tostring(accessoryInfo.AssetId) .. " " .. tostring(accessoryInfo.AccessoryType))
end

local GroupService = game:GetService("GroupService")

local GROUP_ID = 377251

local group = GroupService:GetGroupInfoAsync(GROUP_ID)

print(group.Name .. " has the following roles:")
for _, role in ipairs(group.Roles) do
	print("Rank " .. role.Rank .. ": " .. role.Name)
end

local GroupService = game:GetService("GroupService")

local function getEmblemAsync(groupId)
	local groupInfo = GroupService:GetGroupInfoAsync(groupId)
	return groupInfo.EmblemUrl
end

local part = Instance.new("Part")
part.Anchored = true
part.CanCollide = false
part.Size = Vector3.new(5, 5, 1)
part.Position = Vector3.new(0, 5, 0)

local decal = Instance.new("Decal")
decal.Parent = part
part.Parent = workspace

decal.Texture = getEmblemAsync(377251)

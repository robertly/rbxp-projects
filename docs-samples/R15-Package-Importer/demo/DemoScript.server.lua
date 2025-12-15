local AssetService = game:GetService("AssetService")
local InsertService = game:GetService("InsertService")
local MarketplaceService = game:GetService("MarketplaceService")

local PACKAGE_ASSET_ID = 193700907 -- Circuit Breaker

local function addAttachment(part, name, position, orientation)
	local attachment = Instance.new("Attachment")
	attachment.Name = name
	attachment.Parent = part
	if position then
		attachment.Position = position
	end
	if orientation then
		attachment.Orientation = orientation
	end
	return attachment
end

local function createBaseCharacter()
	local character = Instance.new("Model")

	local humanoid = Instance.new("Humanoid")
	humanoid.Parent = character

	local rootPart = Instance.new("Part")
	rootPart.Name = "HumanoidRootPart"
	rootPart.Size = Vector3.new(2, 2, 1)
	rootPart.Transparency = 1
	rootPart.Parent = character
	addAttachment(rootPart, "RootRigAttachment")

	local head = Instance.new("Part")
	head.Name = "Head"
	head.Size = Vector3.new(2, 1, 1)
	head.Parent = character

	local headMesh = Instance.new("SpecialMesh")
	headMesh.Scale = Vector3.new(1.25, 1.25, 1.25)
	headMesh.MeshType = Enum.MeshType.Head
	headMesh.Parent = head

	local face = Instance.new("Decal")
	face.Name = "face"
	face.Texture = "rbxasset://textures/face.png"
	face.Parent = head

	addAttachment(head, "FaceCenterAttachment")
	addAttachment(head, "FaceFrontAttachment", Vector3.new(0, 0, -0.6))
	addAttachment(head, "HairAttachment", Vector3.new(0, 0.6, 0))
	addAttachment(head, "HatAttachment", Vector3.new(0, 0.6, 0))
	addAttachment(head, "NeckRigAttachment", Vector3.new(0, -0.5, 0))

	return character, humanoid
end

local function createR15Package(packageAssetId)
	local packageAssetInfo = MarketplaceService:GetProductInfo(packageAssetId)

	local character, humanoid = createBaseCharacter()
	character.Name = packageAssetInfo.Name

	local assetIds = AssetService:GetAssetIdsForPackage(packageAssetId)
	for _, assetId in pairs(assetIds) do
		local limb = InsertService:LoadAsset(assetId)
		local r15 = limb:FindFirstChild("R15")
		if r15 then
			for _, part in pairs(r15:GetChildren()) do
				part.Parent = character
			end
		else
			for _, child in pairs(limb:GetChildren()) do
				child.Parent = character
			end
		end
	end

	humanoid:BuildRigFromAttachments()
	return character
end

local r15Package = createR15Package(PACKAGE_ASSET_ID)
r15Package.Parent = workspace

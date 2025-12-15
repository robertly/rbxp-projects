local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local function getOutfitId(bundleId)
	if bundleId <= 0 then
		return
	end
	local info = game.AssetService:GetBundleDetailsAsync(bundleId)
	if not info then
		return
	end
	for _, item in pairs(info.Items) do
		if item.Type == "UserOutfit" then
			return item.Id
		end
	end

	return nil
end

local function getHumanoidDescriptionBundle(bundleId)
	local itemId = getOutfitId(bundleId)
	if itemId and itemId > 0 then
		return Players:GetHumanoidDescriptionFromOutfitId(itemId)
	end

	return nil
end

local humanoidDescription = getHumanoidDescriptionBundle(799)
local humanoidModel = Players:CreateHumanoidModelFromDescription(humanoidDescription, Enum.HumanoidRigType.R15)
humanoidModel.Parent = Workspace

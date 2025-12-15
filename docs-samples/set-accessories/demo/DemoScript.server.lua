local humanoidDescription = Instance.new("HumanoidDescription")
local originalSpecifications = {
	{
		Order = 1,
		AssetId = 123456789,
		Puffiness = 0.5,
		AccessoryType = Enum.AccessoryType.Sweater,
	},
}
humanoidDescription:SetAccessories(originalSpecifications)

local updatedSpecifications = humanoidDescription:GetAccessories(false)
local newIndividualSpecification = {
	Order = 2,
	AssetId = 987654321,
	Puffiness = 0.7,
	AccessoryType = Enum.AccessoryType.Jacket,
	IsLayered = true,
}
updatedSpecifications[#updatedSpecifications + 1] = newIndividualSpecification
humanoidDescription:SetAccessories(updatedSpecifications)

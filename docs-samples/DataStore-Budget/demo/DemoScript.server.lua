local DataStoreService = game:GetService("DataStoreService")

for _, enumItem in pairs(Enum.DataStoreRequestType:GetEnumItems()) do
	print(enumItem.Name, DataStoreService:GetRequestBudgetForRequestType(enumItem))
end

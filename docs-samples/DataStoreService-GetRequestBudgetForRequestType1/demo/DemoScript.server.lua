local DataStoreService = game:GetService("DataStoreService")

local globalStore = DataStoreService:GetGlobalDataStore()

local function printBudget()
	local budget = DataStoreService:GetRequestBudgetForRequestType(Enum.DataStoreRequestType.SetIncrementAsync)
	print("Current set/increment budget:", budget)
end

for i = 1, 5 do
	local key = "key" .. i
	local success, err = pcall(function()
		globalStore:SetAsync(key, true)
	end)
	if success then
		printBudget()
	else
		print(err)
	end
end

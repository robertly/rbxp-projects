local DataStoreService = game:GetService("DataStoreService")

local experienceStore = DataStoreService:GetDataStore("PlayerExperience")

local time = DateTime.fromUniversalTime(2020, 10, 09, 01, 42)

local listSuccess, pages = pcall(function()
	return experienceStore:ListVersionsAsync("User_1234", nil, time.UnixTimestampMillis)
end)

if listSuccess then
	local items = pages:GetCurrentPage()

	for key, info in pairs(items) do
		print("Key:", key, "; Version:", info.Version, "; Created:", info.CreatedTime, "; Deleted:", info.IsDeleted)
	end
end

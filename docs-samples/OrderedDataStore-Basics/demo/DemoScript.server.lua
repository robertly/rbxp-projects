local DataStoreService = game:GetService("DataStoreService")
local pointsStore = DataStoreService:GetOrderedDataStore("Points")

local function printTopTenPlayers()
	local isAscending = false
	local pageSize = 10
	local pages = pointsStore:GetSortedAsync(isAscending, pageSize)
	local topTen = pages:GetCurrentPage()

	-- The data in 'topTen' is stored with the index being the index on the page
	-- For each item, 'data.key' is the key in the OrderedDataStore and 'data.value' is the value
	for rank, data in ipairs(topTen) do
		local name = data.key
		local points = data.value
		print(name .. " is ranked #" .. rank .. " with " .. points .. "points")
	end

	-- Potentially load the next page...
	--pages:AdvanceToNextPageAsync()
end

-- Create some data
pointsStore:SetAsync("Alex", 55)
pointsStore:SetAsync("Charley", 32)
pointsStore:SetAsync("Sydney", 68)

-- Display the top ten players
printTopTenPlayers()

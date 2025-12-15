local MemoryStoreService = game:GetService("MemoryStoreService")

local myMap = MemoryStoreService:GetSortedMap("MySortedMap")

function printAllKeys(map)
	-- the initial lower bound is nil which means to start from the very first item
	local exclusiveLowerBound = nil

	-- this loop continues until the end of the map is reached
	while true do
		-- get up to a hundred items starting from the current lower bound
		local items = map:GetRangeAsync(Enum.SortDirection.Ascending, 100, exclusiveLowerBound)

		for _, item in ipairs(items) do
			print(item.key)
		end

		-- if the call returned less than a hundred items it means we've reached the end of the map
		if #items < 100 then
			break
		end

		-- the last retrieved key is the exclusive lower bound for the next iteration
		exclusiveLowerBound = items[#items].key
	end
end

printAllKeys(myMap)

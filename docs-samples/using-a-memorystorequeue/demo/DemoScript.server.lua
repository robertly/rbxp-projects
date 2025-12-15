local MemoryStoreService = game:GetService("MemoryStoreService")
local DataStoreService = game:GetService("DataStoreService")

local queue = MemoryStoreService:GetQueue("PlayerQueue")
local dataStore = DataStoreService:GetDataStore("PlayerStore")

while true do
	pcall(function()
		-- wait for an item to process
		local items, id = queue:ReadAsync(1, false, 30)

		-- check if an item was retrieved
		if #items > 0 then
			-- mark the item as processed
			dataStore:UpdateAsync(items[0], function(data)
				data = data or {}
				data.processed = 1
				return data
			end)

			-- remove the item from the queue
			queue:RemoveAsync(id)
		end
	end)
end

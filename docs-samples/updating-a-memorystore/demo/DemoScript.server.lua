local MemoryStoreService = game:GetService("MemoryStoreService")
local map = MemoryStoreService:GetSortedMap("AuctionItems")

function placeBid(itemKey, bidAmount)
	map:UpdateAsync(itemKey, function(item)
		item = item or { highestBid = 0 }
		if item.highestBid < bidAmount then
			item.highestBid = bidAmount
			return item
		end
		return nil
	end)
end

placeBid("MyItem", 50)

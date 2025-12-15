local KeyframeSequenceProvider = game:GetService("KeyframeSequenceProvider")

local USER_ID = 0 -- Insert your UserId here

local function extractPages(pagesObject)
	local array = {}
	while true do
		local thisPage = pagesObject:GetCurrentPage()
		for _, v in pairs(thisPage) do
			table.insert(array, v)
		end
		if pagesObject.IsFinished then
			break
		end
		pagesObject:AdvanceToNextPageAsync()
	end
	return array
end

local inventoryPages = KeyframeSequenceProvider:GetAnimations(USER_ID)

local animationIds = extractPages(inventoryPages)

for _, id in pairs(animationIds) do
	print(id)
end
print("total: ", #animationIds)

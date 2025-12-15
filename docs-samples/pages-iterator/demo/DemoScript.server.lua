-- Reformat pages as tables
local function pagesToTable(pages)
	local items = {}
	while true do
		table.insert(items, pages:GetCurrentPage())
		if pages.IsFinished then
			break
		end
		pages:AdvanceToNextPageAsync()
	end
	return items
end

local function iterPageItems(pages)
	local contents = pagesToTable(pages)
	-- Track the current page number starting at 1
	local pageNum = 1
	-- Get last page number so we don't iterate over it
	local lastPageNum = #contents

	-- for resumes this coroutine until there's nothing to go through
	return coroutine.wrap(function()
		-- Loop until page number is greater than last page number
		while pageNum <= lastPageNum do
			-- Go through all the entries of the current page
			for _, item in ipairs(contents[pageNum]) do
				-- Pause loop to let developer handle entry and page number
				coroutine.yield(item, pageNum)
			end
			pageNum += 1
		end
	end)
end

-- Using the iterPageItems function to iterate through the pages of a catalog search

local AvatarEditorService = game:GetService("AvatarEditorService")

local parameters = CatalogSearchParams.new()
parameters.SearchKeyword = "Hair"
local catalogPages = AvatarEditorService:SearchCatalog(parameters)

for item, pageNumber in iterPageItems(catalogPages) do
	print(item, pageNumber)
end

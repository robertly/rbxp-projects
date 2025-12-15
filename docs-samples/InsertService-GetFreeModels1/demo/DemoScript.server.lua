local InsertService = game:GetService("InsertService")

local page = unpack(InsertService:GetFreeModels("Cats", 0)) -- Search for "Cats" on Page 1.

for i = 1, page.TotalCount do
	local item = page.Results[i]
	print("Item #" .. i)
	for key, value in pairs(item) do
		print(" " .. key .. ": " .. value)
	end
end

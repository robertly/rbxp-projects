local AssetService = game:GetService("AssetService")

local pages = AssetService:GetGamePlacesAsync()

while true do
	for _, place in pairs(pages:GetCurrentPage()) do
		print("Name: " .. place.Name)
		print("PlaceId: " .. tostring(place.PlaceId))
	end
	if pages.IsFinished then
		-- We reached the last page of results
		break
	end
	pages:AdvanceToNextPageAsync()
end

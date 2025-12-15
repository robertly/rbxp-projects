local Players = game:GetService("Players")

local approvedPlaceIds = { 1 } -- insert approved PlaceIds here

local function isPlaceIdApproved(placeId)
	for _, id in pairs(approvedPlaceIds) do
		if id == placeId then
			return true
		end
	end
	return false
end

local function onPlayerAdded(player)
	local joinData = player:GetJoinData()

	-- verify this data was sent by an approved place
	if isPlaceIdApproved(joinData.SourcePlaceId) then
		local teleportData = joinData.TeleportData
		if teleportData then
			local currentLevel = teleportData.currentLevel
			print(player.Name .. " is on level " .. currentLevel)
		end
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

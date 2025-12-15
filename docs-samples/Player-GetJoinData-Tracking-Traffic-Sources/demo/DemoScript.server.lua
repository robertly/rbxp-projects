local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local analyticsStore = DataStoreService:GetDataStore("Analytics")

local ALLOWED_SOURCES = {
	"twitter",
	"youtube",
	"discord",
}

local function onPlayerAdded(player)
	local source = player:GetJoinData().LaunchData
	-- check if the provided source is valid
	if source and table.find(ALLOWED_SOURCES, source) then
		-- update the data store to track the source popularity
		local success, result = pcall(analyticsStore.IncrementAsync, analyticsStore, source)

		if success then
			print(player.Name, "joined from", source, "- total:", result)
		else
			warn("Failed to record join source: " .. result)
		end
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

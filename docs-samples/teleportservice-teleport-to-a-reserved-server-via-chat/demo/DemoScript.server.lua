local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local dataStore = DataStoreService:GetGlobalDataStore()

-- Get the saved code
local code = dataStore:GetAsync("ReservedServer")
if typeof(code) ~= "string" then -- None saved, create one
	code = TeleportService:ReserveServer(game.PlaceId)
	dataStore:SetAsync("ReservedServer", code)
end

local function joined(player)
	player.Chatted:Connect(function(message)
		if message == "reserved" then
			TeleportService:TeleportToPrivateServer(game.PlaceId, code, { player })
		end
	end)
end

Players.PlayerAdded:Connect(joined)

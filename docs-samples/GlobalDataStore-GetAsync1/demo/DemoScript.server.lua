local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local goldDataStore = DataStoreService:GetDataStore("Gold")

local STARTING_GOLD = 100

local function onPlayerAdded(player)
	local playerKey = "Player_" .. player.UserId

	local leaderstats = Instance.new("IntValue")
	leaderstats.Name = "leaderstats"

	local gold = Instance.new("IntValue")
	gold.Name = "Gold"
	gold.Parent = leaderstats

	local success, result = pcall(function()
		return goldDataStore:GetAsync(playerKey) or STARTING_GOLD
	end)
	if success then
		gold.Value = result
	else
		-- Failed to retrieve data
		warn(result)
	end

	leaderstats.Parent = player
end

Players.PlayerAdded:Connect(onPlayerAdded)

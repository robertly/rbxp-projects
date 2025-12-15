local AnalyticsService = game:GetService("AnalyticsService")
local Players = game:GetService("Players")

local wisdomStone = script.Parent

wisdomStone.Touched:Connect(function(otherPart)
	local player = Players:GetPlayerFromCharacter(otherPart.Parent)
	if player == nil then
		return
	end

	local location = {
		["placeDesc"] = "Dungeon1",
		["mapDesc"] = "LeftChamberMap",
	}

	local statistics = {
		["amountOfExp"] = 1337,
		["amountOfGold"] = 1337,
		["kills"] = 1337,
	}

	AnalyticsService:FirePlayerProgressionEvent(
		player,
		Enum.AnalyticsProgressionStatus.Complete, -- progressionStatus
		"LevelUp", -- category
		location,
		statistics, -- optional
		{ AcquireType = "PickUp" }
	) -- customData optional
end)

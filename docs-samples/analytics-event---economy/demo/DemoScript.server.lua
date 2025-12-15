local AnalyticsService = game:GetService("AnalyticsService")

local gold = script.Parent

gold.Touched:Connect(function(otherPart)
	local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)
	if player == nil then
		return
	end

	local location = {
		["Map"] = "someMap",
		["Position"] = tostring(gold.Position),
	}

	AnalyticsService:FireInGameEconomyEvent(
		player,
		"Sword", -- item name
		Enum.AnalyticsEconomyAction.Spend,
		"Weapon", -- itemCategory
		2020, -- amount of Gold
		"Gold", -- currency
		location,
		{ SomeCustomKey = "SomeCustomValue" }
	) -- optional customData
end)

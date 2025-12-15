local AnalyticsService = game:GetService("AnalyticsService")
local Players = game:GetService("Players")

-- server event, report a new server started
local serverInfo = {
	Time = os.time(),
	PlaceId = game.PlaceId,
}

AnalyticsService:FireCustomEvent(nil, "ServerStart", serverInfo)

Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		local customData = {
			Time = os.time(),
			Message = message,
		}
		AnalyticsService:FireCustomEvent(player, "PlayerChatted", customData)
	end)
end)

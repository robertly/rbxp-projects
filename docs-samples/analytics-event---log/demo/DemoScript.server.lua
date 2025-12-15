local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local AnalyticsService = game:GetService("AnalyticsService")

local placeId = game.PlaceId

local player = Players:GetPlayerByUserId(123)

xpcall(function()
	TeleportService:Teleport(placeId, player)
end, function(errorMessage)
	local debugInfo = {
		errorCode = "TeleportFailed",
		stackTrace = debug.traceback(), -- the function call stack
	}
	AnalyticsService:FireLogEvent(
		player,
		Enum.AnalyticsLogLevel.Error, -- log level
		errorMessage, -- message
		debugInfo, -- optional
		{
			PlayerId = player.UserId,
			PlaceId = placeId,
		}
	) -- customData optional
end)

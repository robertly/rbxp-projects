local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	-- Is this player following anyone?
	local followId = player.FollowUserId
	-- If so, find out where they are
	if followId and followId ~= 0 then
		local _currentInstance, _errorMessage, placeId, jobId
		local success, errorMessage = pcall(function()
			-- followId is the user ID of the player that you want to retrieve the place and job ID for
			_currentInstance, _errorMessage, placeId, jobId = TeleportService:GetPlayerPlaceInstanceAsync(followId)
		end)
		if success then
			-- Teleport player
			TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
		else
			warn(errorMessage)
		end
	else
		warn("Player " .. player.UserId .. " is not following another player!")
	end
end)

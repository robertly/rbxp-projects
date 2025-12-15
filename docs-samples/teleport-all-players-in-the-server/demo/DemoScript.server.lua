local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local PLACE_ID = 0 -- replace
local playerList = Players:GetPlayers()

local success, result = pcall(function()
	return TeleportService:TeleportPartyAsync(PLACE_ID, playerList)
end)

if success then
	local jobId = result
	print("Players teleported to", jobId)
else
	warn(result)
end

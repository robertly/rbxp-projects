local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local function onPlayerAdded(player)
	local launchData = player:GetJoinData().LaunchData
	if launchData then
		-- attempt to decode the data
		local success, result = pcall(HttpService.JSONDecode, HttpService, launchData)
		if success then
			print(player.Name, "joined with data:", result)
		else
			-- this is probably due to the user messing with the URL
			warn("Failed to parse launch data:" .. result)
		end
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

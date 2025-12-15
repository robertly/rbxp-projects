local Players = game:GetService("Players")

local function onPlayerAdded(player)
	local function onIdled(time)
		print("Player has been idle for " .. time .. " seconds")
	end

	player.Idled:Connect(onIdled)
end

Players.PlayerAdded:Connect(onPlayerAdded)

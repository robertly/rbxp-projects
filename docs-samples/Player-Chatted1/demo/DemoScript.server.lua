local Players = game:GetService("Players")

local function onPlayerAdded(player)
	local function onChatted(message)
		-- do stuff with message and player
		print(message)
	end

	player.Chatted:Connect(onChatted)
end

Players.PlayerAdded:Connect(onPlayerAdded)

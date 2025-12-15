local MessagingService = game:GetService("MessagingService")
local Players = game:GetService("Players")

local function onPlayerAdded(player)
	--subscribe to the topic
	local topic = "player-" .. player.UserId
	local connection = MessagingService:SubscribeAsync(topic, function(message)
		print("Received message for", player.Name, message.Data)
	end)

	player.AncestryChanged:Connect(function()
		-- unsubscribe from the topic
		connection:Disconnect()
	end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

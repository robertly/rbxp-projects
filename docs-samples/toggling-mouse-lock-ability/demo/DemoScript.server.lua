local Players = game:GetService("Players")

local function toggleMouseLock(player)
	player.DevEnableMouseLock = not player.DevEnableMouseLock
	if player.DevEnableMouseLock then
		print("Mouse lock is available")
	else
		print("Mouse lock is not available")
	end
end

local function onPlayerChatted(player, message, _recipient)
	if message == "mouselock" then
		toggleMouseLock(player)
	end
end

local function onPlayerAdded(player)
	player.Chatted:Connect(function(...)
		onPlayerChatted(player, ...)
	end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

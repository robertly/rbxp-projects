local Players = game:GetService("Players")

local function onPlayerChatted(playerChatType, sender, message, recipient)
	print(sender.Name, "-", message, "-", playerChatType, "-", (recipient or "All"))
end

Players.PlayerChatted:Connect(onPlayerChatted)

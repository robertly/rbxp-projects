local Players = game:GetService("Players")

local function onPlayerAdded(player)
	print(player:IsVerified())
end

for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
Players.PlayerAdded:Connect(onPlayerAdded)

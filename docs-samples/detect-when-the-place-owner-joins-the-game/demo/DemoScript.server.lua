local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	if game.CreatorType == Enum.CreatorType.User then
		if player.UserId == game.CreatorId then
			print("The place owner has joined the game!")
		end
	elseif game.CreatorType == Enum.CreatorType.Group then
		if player:IsInGroup(game.CreatorId) then
			print("A member of the group that owns the place has joined the game!")
		end
	end
end)

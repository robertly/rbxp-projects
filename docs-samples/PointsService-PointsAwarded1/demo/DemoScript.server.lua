local PointsService = game:GetService("PointsService")

local function onPointsAwarded(userId, pointsAwarded, userBalanceInGame, userTotalBalance)
	print(
		"User:",
		userId,
		"has now earned",
		userBalanceInGame,
		"(+",
		pointsAwarded,
		") points in the current game, now making their total balance",
		userTotalBalance
	)
end

PointsService.PointsAwarded:Connect(onPointsAwarded)

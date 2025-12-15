local Players = game:GetService("Players")

local function onPlayerAdded(player)
	-- Create a container for leaderstats
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"

	-- Create one leaderstat value
	local vScore = Instance.new("IntValue")
	vScore.Name = "Score"
	vScore.Value = 0
	vScore.Parent = leaderstats

	-- Add to player (displaying it)
	leaderstats.Parent = player
end

Players.PlayerAdded:Connect(onPlayerAdded)

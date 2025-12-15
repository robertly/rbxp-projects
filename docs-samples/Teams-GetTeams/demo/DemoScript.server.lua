local Teams = game:GetService("Teams")

local teams = Teams:GetTeams()

for _, team in pairs(teams) do
	local players = team:GetPlayers()
	print("Team", team.Name, "has", #players, "players")
end

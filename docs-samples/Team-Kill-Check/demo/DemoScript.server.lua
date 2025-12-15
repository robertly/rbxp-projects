local Players = game:GetService("Players")

function checkTeamKill(playerAttack, playerVictim)
	if playerAttack.Team ~= playerVictim.Team or playerAttack.Neutral or playerVictim.Neutral then
		return false
	end
	return true
end

local players = Players:GetPlayers()

checkTeamKill(players[1], players[2])

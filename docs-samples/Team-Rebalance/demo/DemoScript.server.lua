local Teams = game:GetService("Teams")

-- create two teams
local redTeam = Instance.new("Team")
redTeam.TeamColor = BrickColor.new("Bright red")
redTeam.AutoAssignable = true
redTeam.Name = "Red Team"
redTeam.Parent = Teams

local blueTeam = Instance.new("Team")
blueTeam.TeamColor = BrickColor.new("Bright blue")
blueTeam.AutoAssignable = true
blueTeam.Name = "Blue Team"
blueTeam.Parent = Teams

-- start counting the number of players on each team
local numberRed, numberBlue = 0, 0

local function playerAdded(team)
	-- increase the team's count by 1
	if team == redTeam then
		numberRed = numberRed + 1
	elseif team == blueTeam then
		numberBlue = numberBlue + 1
	end
end

local function playerRemoved(team)
	-- decrease the team's count by 1
	if team == redTeam then
		numberRed = numberRed - 1
	elseif team == blueTeam then
		numberBlue = numberBlue - 1
	end

	-- check if the teams are unbalanced
	local bigTeam, smallTeam = nil, nil
	if (numberRed - numberBlue) > 2 then
		bigTeam = redTeam
		smallTeam = blueTeam
	elseif (numberBlue - numberRed) > 2 then
		bigTeam = blueTeam
		smallTeam = redTeam
	end

	if bigTeam then
		-- pick a random player
		local playerList = bigTeam:GetPlayers()
		local player = playerList[math.random(1, #playerList)]

		-- check the player exists
		if player then
			-- change the player's team
			player.TeamColor = smallTeam.TeamColor
			-- respawn the player
			player:LoadCharacter()
		end
	end
end

-- listen for players being added / removed
blueTeam.PlayerAdded:Connect(function(_player)
	playerAdded(blueTeam)
end)

blueTeam.PlayerRemoved:Connect(function(_player)
	playerRemoved(blueTeam)
end)

redTeam.PlayerAdded:Connect(function(_player)
	playerAdded(redTeam)
end)

redTeam.PlayerRemoved:Connect(function(_player)
	playerRemoved(redTeam)
end)

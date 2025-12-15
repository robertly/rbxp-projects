local GroupService = game:GetService("GroupService")
local Players = game:GetService("Players")

-- define group id here
local GROUP_ID = 271454

-- utility function for dealing with pages
local function pagesToArray(pages)
	local array = {}
	while true do
		for _, v in ipairs(pages:GetCurrentPage()) do
			table.insert(array, v)
		end
		if pages.IsFinished then
			break
		end
		pages:AdvanceToNextPageAsync()
	end
	return array
end

-- get lists of allies and enemies
local alliesPages = GroupService:GetAlliesAsync(GROUP_ID)
local enemiesPages = GroupService:GetEnemiesAsync(GROUP_ID)

-- convert to array
local allies = pagesToArray(alliesPages)
local enemies = pagesToArray(enemiesPages)

local function playerAdded(player)
	-- check to see if the player is in the group
	if player:IsInGroup(GROUP_ID) then
		print(player.Name .. " is a member!")
	else
		local isAlly, isEnemy = false, false

		-- check to see if the player is in any ally groups
		for _, groupInfo in ipairs(allies) do
			local groupId = groupInfo.Id
			if player:IsInGroup(groupId) then
				isAlly = true
				break
			end
		end

		-- check to see if the player is in any enemy groups
		for _, groupInfo in ipairs(enemies) do
			local groupId = groupInfo.Id
			if player:IsInGroup(groupId) then
				isEnemy = true
				break
			end
		end

		if isAlly and not isEnemy then
			print(player.Name .. " is an ally!")
		elseif isEnemy and not isAlly then
			print(player.Name .. " is an enemy!")
		elseif isEnemy and isAlly then
			print(player.Name .. " is both an ally and an enemy!")
		else
			print(player.Name .. " is neither an ally or an enemy!")
		end
	end
end

-- listen for new players being added
Players.PlayerAdded:Connect(playerAdded)

-- handle players already in game
for _, player in ipairs(Players:GetPlayers()) do
	playerAdded(player)
end

local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")

local OWNER_ID = 212423 -- can use game.CreatorId for published places
local BADGE_ID = 1

local ownerInGame = false

local function playerAdded(newPlayer)
	if newPlayer.UserId == OWNER_ID then
		-- if new player is the owner, set ownerInGame to true and give everyone the badge
		ownerInGame = true
		for _, player in pairs(Players:GetPlayers()) do
			-- don't award the owner
			if player ~= newPlayer then
				BadgeService:AwardBadge(player.UserId, BADGE_ID)
			end
		end
	elseif ownerInGame then
		-- if the owner is in the game, award the badge
		BadgeService:AwardBadge(newPlayer.UserId, BADGE_ID)
	end
end

local function playerRemoving(oldPlayer)
	if oldPlayer.UserId == OWNER_ID then
		ownerInGame = false
	end
end

Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(playerRemoving)

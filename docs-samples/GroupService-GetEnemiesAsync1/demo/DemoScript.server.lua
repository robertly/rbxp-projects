local Players = game:GetService("Players")
local GroupService = game:GetService("GroupService")

local GROUP_ID = 57

-- creates a list of all of the enemies of a given group
local enemies = {}

local pages = GroupService:GetEnemiesAsync(GROUP_ID)

while true do
	for _, group in pairs(pages:GetCurrentPage()) do
		table.insert(enemies, group)
	end
	if pages.IsFinished then
		break
	end
	pages:AdvanceToNextPageAsync()
end

function onPlayerAdded(player)
	for _, enemyGroup in pairs(enemies) do
		if player:IsInGroup(enemyGroup.Id) then
			print("Player is an enemy!")
			break
		end
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)
-- handle players who joined while the enemies list was still loading
for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end

local Players = game:GetService("Players")
local GroupService = game:GetService("GroupService")

local GROUP_ID = 57

-- creates a table of all of the allies of a given group
local allies = {}

local pages = GroupService:GetAlliesAsync(GROUP_ID)

while true do
	for _, group in pairs(pages:GetCurrentPage()) do
		table.insert(allies, group)
	end
	if pages.IsFinished then
		break
	end
	pages:AdvanceToNextPageAsync()
end

function onPlayerAdded(player)
	for _, group in pairs(allies) do
		if player:IsInGroup(group.Id) then
			print("Player is an ally!")
			break
		end
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)
-- handle players who joined while the allies list was still loading
for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end

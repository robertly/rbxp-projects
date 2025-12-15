local Players = game:GetService("Players")

local function addSpawn(spawnLocation)
	-- listen for the spawn being touched
	spawnLocation.Touched:Connect(function(hit)
		local character = hit:FindFirstAncestorOfClass("Model")
		if character then
			local player = Players:GetPlayerFromCharacter(character)
			if player and player.RespawnLocation ~= spawnLocation then
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				-- make sure the character isn't dead
				if humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
					print("spawn set")
					player.RespawnLocation = spawnLocation
				end
			end
		end
	end)
end

local firstSpawn

-- look through the workspace for spawns
for _, descendant in pairs(workspace:GetDescendants()) do
	if descendant:IsA("SpawnLocation") then
		if descendant.Name == "FirstSpawn" then
			firstSpawn = descendant
		end
		addSpawn(descendant)
	end
end

local function playerAdded(player)
	player.RespawnLocation = firstSpawn
end

-- listen for new players
Players.PlayerAdded:Connect(playerAdded)

-- go through existing players
for _, player in pairs(Players:GetPlayers()) do
	playerAdded(player)
end

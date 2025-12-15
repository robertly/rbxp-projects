local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- This table maps "Player" objects to Vector3
local respawnLocations = {}

local function onCharacterAdded(character)
	local player = Players:GetPlayerFromCharacter(character)
	-- Check if we saved a respawn location for this player
	if respawnLocations[player] then
		-- Teleport the player there when their HumanoidRootPart is available
		local hrp = character:WaitForChild("HumanoidRootPart")
		-- Wait a brief moment before teleporting, as Roblox will teleport the
		-- player to their designated SpawnLocation (which we will override)
		RunService.Stepped:wait()
		hrp.CFrame = CFrame.new(respawnLocations[player] + Vector3.new(0, 3.5, 0))
	end
end

local function onCharacterRemoving(character)
	-- Get the player and their HumanoidRootPart and save their death location
	local player = Players:GetPlayerFromCharacter(character)
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if hrp then
		respawnLocations[player] = hrp.Position
	end
end

local function onPlayerAdded(player)
	-- Listen for spawns/despawns
	player.CharacterAdded:Connect(onCharacterAdded)
	player.CharacterRemoving:Connect(onCharacterRemoving)
end

local function onPlayerRemoved(player)
	-- Forget the respawn location of any player who is leaving; this prevents
	-- a memory leak if potentially many players visit
	respawnLocations[player] = nil
end

-- Note that we're NOT using PlayerRemoving here, since CharacterRemoving fires
-- AFTER PlayerRemoving, we don't want to forget the respawn location then instantly
-- save another right after
Players.PlayerAdded:Connect(onPlayerAdded)
Players.ChildRemoved:Connect(onPlayerRemoved)

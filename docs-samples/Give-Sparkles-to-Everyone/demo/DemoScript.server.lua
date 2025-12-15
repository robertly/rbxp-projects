local Players = game:GetService("Players")

local function onCharacterAdded(character)
	-- Give them sparkles on their head if they don't have them yet
	if not character:FindFirstChild("Sparkles") then
		local sparkles = Instance.new("Sparkles")
		sparkles.Parent = character:WaitForChild("Head")
	end
end

local function onPlayerAdded(player)
	-- Check if they already spawned in
	if player.Character then
		onCharacterAdded(player.Character)
	end
	-- Listen for the player (re)spawning
	player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)

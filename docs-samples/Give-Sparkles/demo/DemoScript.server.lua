local Players = game:GetService("Players")

local function onCharacterSpawned(character)
	local hrp = character:WaitForChild("HumanoidRootPart")
	-- Add sparkles that are colored to the player's torso color
	local sparkles = Instance.new("Sparkles")
	sparkles.Parent = hrp
	sparkles.SparkleColor = character:WaitForChild("Body Colors").TorsoColor.Color
	sparkles.Enabled = true
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterSpawned)
end

Players.PlayerAdded:Connect(onPlayerAdded)

local Players = game:GetService("Players")

local player = Players.LocalPlayer

local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")
	local currentHealth = humanoid.Health

	local function onHealthChanged(health)
		local change = math.abs(currentHealth - health)
		print("The humanoid's health", (currentHealth > health and "decreased by" or "increased by"), change)
		currentHealth = health
	end

	humanoid.HealthChanged:Connect(onHealthChanged)
end

player.CharacterAdded:Connect(onCharacterAdded)

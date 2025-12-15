local RunService = game:GetService("RunService")

local prompt = script.Parent

local playersHealing = {}

RunService.Stepped:Connect(function(_currentTime, deltaTime)
	for player, _value in pairs(playersHealing) do
		local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			humanoid.Health = humanoid.Health + 30 * deltaTime
		end
	end
end)

prompt.Triggered:Connect(function(player)
	playersHealing[player] = true
end)

prompt.TriggerEnded:Connect(function(player)
	playersHealing[player] = nil
end)

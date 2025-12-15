local Players = game:GetService("Players")

local function onPlayerAdded(player)
	local loaded = player:HasAppearanceLoaded()
	print(loaded)

	while not loaded do
		loaded = player:HasAppearanceLoaded()
		print(loaded)
		task.wait()
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

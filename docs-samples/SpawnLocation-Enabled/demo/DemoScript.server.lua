local spawnLocation = Instance.new("SpawnLocation")
spawnLocation.Anchored = true
spawnLocation.Size = Vector3.new(5, 1, 5)
spawnLocation.Neutral = true -- anyone can spawn here
spawnLocation.Enabled = true
spawnLocation.Parent = workspace

local function onEnabledChanged()
	spawnLocation.Transparency = spawnLocation.Enabled and 0 or 0.5
end

spawnLocation:GetPropertyChangedSignal("Enabled"):Connect(onEnabledChanged)

task.wait(5)

spawnLocation.Enabled = false -- transparency = 0.5

local imageLabel = script.Parent

local startTime = workspace.DistributedGameTime

-- Wait for the image to load
while not imageLabel.IsLoaded do
	task.wait()
end

-- Measure and display how long it took to load
local deltaTime = workspace.DistributedGameTime - startTime
print(("Image loaded in %.3f seconds"):format(deltaTime))

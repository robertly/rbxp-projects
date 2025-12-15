local textLabel = script.Parent

-- How fast the highlight ought to blink
local freq = 2

-- Set to yellow highlight color
textLabel.TextStrokeColor3 = Color3.new(1, 1, 0)

while true do
	-- math.sin oscillates from -1 to 1, so we change the range to 0 to 1:
	local transparency = math.sin(workspace.DistributedGameTime * math.pi * freq) * 0.5 + 0.5
	textLabel.TextStrokeTransparency = transparency
	task.wait()
end

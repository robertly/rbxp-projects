-- Place in a script in a UIListLayout
local uiGridLayout = script.Parent

-- Some data to work with
local scores = {
	["Player1"] = 2048,
	["Ozzypig"] = 1337,
	["Shedletsky"] = 1250,
	["Cozecant"] = 96,
}

-- Build a scoreboard
for name, score in pairs(scores) do
	local textLabel = Instance.new("TextLabel")
	textLabel.Text = name .. ": " .. score
	textLabel.Parent = script.Parent
	textLabel.LayoutOrder = -score -- We want higher scores first, so negate for descending order
	textLabel.Name = name
	textLabel.Size = UDim2.new(0, 200, 0, 50)
	textLabel.Parent = uiGridLayout.Parent
end

while true do
	-- The name is the player's name
	uiGridLayout.SortOrder = Enum.SortOrder.Name
	uiGridLayout:ApplyLayout()
	task.wait(2)
	-- Since we set the LayoutOrder to the score, this will sort by descending score!
	uiGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiGridLayout:ApplyLayout()
	task.wait(2)
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Place a StringValue called "GameState" in the ReplicatedStorage
local vGameState = ReplicatedStorage:WaitForChild("GameState")
-- Place this code in a TextLabel
local textLabel = script.Parent

-- Some colors we'll use with TextColor3
local colorNormal = Color3.new(0, 0, 0) -- black
local colorCountdown = Color3.new(1, 0.5, 0) -- orange
local colorRound = Color3.new(0.25, 0.25, 1) -- blue

-- We'll run this function to update the TextLabel as the state of the
-- game changes.
local function update()
	-- Update the text
	textLabel.Text = "State: " .. vGameState.Value
	-- Set the color of the text based on the current game state
	if vGameState.Value == "Countdown" then
		textLabel.TextColor3 = colorCountdown
	elseif vGameState.Value == "Round" then
		textLabel.TextColor3 = colorRound
	else
		textLabel.TextColor3 = colorNormal
	end
end

-- Pattern: update once when we start and also when vGameState changes
-- We should always see the most updated GameState.
update()
vGameState.Changed:Connect(update)

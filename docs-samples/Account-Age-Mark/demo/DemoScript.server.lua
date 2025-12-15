local Players = game:GetService("Players")

local MAX_AGE_NEW_PLAYER = 7 -- one week
local MIN_AGE_VETERAN = 365 -- one year

-- This function marks a part with text using a BillboardGui
local function mark(part, text)
	local bbgui = Instance.new("BillboardGui")
	bbgui.AlwaysOnTop = true
	bbgui.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
	bbgui.Size = UDim2.new(0, 200, 0, 50)
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0) -- Fill parent
	textLabel.Text = text
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextStrokeTransparency = 0
	textLabel.BackgroundTransparency = 1
	textLabel.Parent = bbgui
	-- Add to part
	bbgui.Parent = part
	bbgui.Adornee = part
end

local function onPlayerSpawned(player, character)
	local head = character:WaitForChild("Head")
	if player.AccountAge >= MIN_AGE_VETERAN then
		mark(head, "Veteran Player")
	elseif player.AccountAge <= MAX_AGE_NEW_PLAYER then
		mark(head, "New Player")
	else
		mark(head, "Regular Player")
	end
end

local function onPlayerAdded(player)
	-- Listen for this player spawning
	if player.Character then
		onPlayerSpawned(player, player.Character)
	end
	player.CharacterAdded:Connect(function()
		onPlayerSpawned(player, player.Character)
	end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

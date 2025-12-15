local clickDetector = script.Parent

local function onClicked(player)
	-- Show a message to the player
	local msg = Instance.new("Message")
	msg.Parent = player:FindFirstChild("PlayerGui")
	msg.Text = "Hello, " .. player.Name
	wait(2.5)
	msg:Destroy()
end

-- Connect the function to the MouseClick event
clickDetector.MouseClick:Connect(onClicked)

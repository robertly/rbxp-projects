local Players = game:GetService("Players")

local disguiseCommand = "/disguise "

local function onPlayerChatted(player, message)
	if message:sub(1, disguiseCommand:len()):lower() == disguiseCommand:lower() then
		local input = message:sub(disguiseCommand:len() + 1)
		local id = tonumber(input)
		if not id then -- Number failed to parse, maybe they typed a username instead
			pcall(function() -- This call can fail sometimes!
				id = Players:GetUserIdFromNameAsync(input) -- Fetch ID from name
			end)
		end
		if id then
			-- Set character appearance then respawn
			player.CharacterAppearanceId = id
			player:LoadCharacter()
		else
			-- We couldn't get an ID from their input
			warn("Failed to get ID!")
		end
	end
end

local function onPlayerAdded(player)
	player.Chatted:Connect(function(...)
		onPlayerChatted(player, ...)
	end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

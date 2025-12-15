local Players = game:GetService("Players")

local FORCE_FIELD_DURATION = 15

local function giveForcefield(player, duration)
	local character = player.Character
	if character then
		local forceField = Instance.new("ForceField")
		forceField.Visible = true
		forceField.Parent = character
		if duration then
			task.delay(duration, function()
				if forceField then
					forceField:Destroy()
				end
			end)
		end
	end
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function(_character)
		giveForcefield(player, FORCE_FIELD_DURATION)
	end)
end

Players.PlayerAdded(onPlayerAdded)

local Players = game:GetService("Players")

local seat = Instance.new("Seat")
seat.Anchored = true
seat.Position = Vector3.new(0, 1, 0)
seat.Parent = workspace

local currentPlayer = nil

local function onOccupantChanged()
	local humanoid = seat.Occupant
	if humanoid then
		local character = humanoid.Parent
		local player = Players:GetPlayerFromCharacter(character)
		if player then
			print(player.Name .. " has sat down")
			currentPlayer = player
			return
		end
	end
	if currentPlayer then
		print(currentPlayer.Name .. " has got up")
		currentPlayer = nil
	end
end

seat:GetPropertyChangedSignal("Occupant"):Connect(onOccupantChanged)

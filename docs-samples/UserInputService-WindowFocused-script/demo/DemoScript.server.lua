local ReplicatedStorage = game:GetService("ReplicatedStorage")

local afkEvent = Instance.new("RemoteEvent")
afkEvent.Name = "AfkEvent"
afkEvent.Parent = ReplicatedStorage

local function setAfk(player, afk)
	if afk then
		local forcefield = Instance.new("ForceField")
		forcefield.Parent = player.Character
	else
		local forcefield = player.Character:FindFirstChildOfClass("ForceField")
		if forcefield then
			forcefield:Destroy()
		end
	end
end

afkEvent.OnServerEvent:Connect(setAfk)

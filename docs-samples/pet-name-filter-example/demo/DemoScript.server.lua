local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")

local Remotes = Instance.new("Folder")
Remotes.Name = "PetNamingRemotes"
Remotes.Parent = ReplicatedStorage

local UserNamedPet = Instance.new("RemoteEvent")
UserNamedPet.Name = "UserNamedPet"
UserNamedPet.Parent = Remotes

local SendPetName = Instance.new("RemoteEvent")
SendPetName.Name = "SendPetName"
SendPetName.Parent = Remotes

local RequestAllPetNames = Instance.new("RemoteFunction")
RequestAllPetNames.Name = "RequestAllPetNames"
RequestAllPetNames.Parent = Remotes

local filterResults = {}

local function broadcastPetName(userId)
	local filterResult = filterResults[userId]
	if filterResult then
		for _, player in pairs(Players:GetPlayers()) do
			if player then
				-- spawn a new thread so as to not yield the update
				task.spawn(function()
					-- grab the filtered string for this user
					local toUserId = player.UserId
					local filteredString = filterResult:GetNonChatStringForUserAsync(toUserId)
					filteredString = filteredString or ""
					SendPetName:FireClient(player, userId, filteredString)
				end)
			end
		end
	end
end

UserNamedPet.OnServerEvent:Connect(function(player, petName)
	local fromUserId = player.UserId

	-- pcall to catch errors
	local success, result = pcall(function()
		return TextService:FilterStringAsync(petName, fromUserId)
	end)

	if success then
		filterResults[fromUserId] = result
		broadcastPetName(fromUserId)
	else
		print("Could not filter pet name")
	end
end)

RequestAllPetNames.OnServerInvoke = function(player)
	local toUserId = player.UserId

	local petNames = {}

	-- go through filter results and filter the pet name to be sent
	for fromUserId, filterResult in pairs(filterResults) do
		local filteredString = filterResult:GetNonChatStringForUserAsync(toUserId)
		filteredString = filteredString or ""

		-- need to convert userId to string so it can't be sent via a remote function
		petNames[tostring(fromUserId)] = filteredString
	end

	return petNames
end

Players.PlayerRemoving:Connect(function(oldPlayer)
	local userId = oldPlayer.UserId
	filterResults[userId] = nil
end)

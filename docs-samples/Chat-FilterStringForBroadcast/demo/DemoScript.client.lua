local Players = game:GetService("Players")
local Chat = game:GetService("Chat")

local playerFrom = Players.LocalPlayer
local message = "Hello world!"

-- Filter the string and store the result in the 'FilteredString' variable
local filteredString = Chat:FilterStringForBroadcast(message, playerFrom)

print(filteredString)

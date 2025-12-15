-- Can only be used in a plugin
local StudioService = game:GetService("StudioService")
local Players = game:GetService("Players")

local loggedInUserId = StudioService:GetUserId()
local loggedInUserName = Players:GetNameFromUserIdAsync(loggedInUserId)
print("Hello,", loggedInUserName)

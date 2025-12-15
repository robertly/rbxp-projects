local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local PLACE_ID = 0 -- replace here
local USER_ID = 1 -- replace with player's UserId

local player = Players:GetPlayerByUserId(USER_ID)

TeleportService:Teleport(PLACE_ID, player)

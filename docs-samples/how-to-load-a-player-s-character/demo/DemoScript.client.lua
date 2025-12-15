local Players = game:GetService("Players")

local USER_ID = 772462

local player = Players.LocalPlayer

player.CharacterAppearanceId = USER_ID
player:LoadCharacterBlocking()

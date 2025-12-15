local Players = game:GetService("Players")

local player = Players.LocalPlayer

player:RemoveCharacter()
task.wait(5)
player:LoadCharacter()

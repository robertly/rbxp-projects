local Players = game:GetService("Players")

local player = Players.LocalPlayer

if player.Neutral then
	print("Player is neutral!")
else
	print("Player is not neutral!")
end

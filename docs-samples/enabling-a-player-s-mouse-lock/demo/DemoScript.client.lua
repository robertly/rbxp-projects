local Players = game:GetService("Players")

local player = Players.LocalPlayer

while true do
	player.DevEnableMouseLock = not player.DevEnableMouseLock
	task.wait(5)
end

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- Wait for the player's character and humanoid, which must exist before calling :Move()
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
character:WaitForChild("Humanoid")

-- The player will move until they are 50 studs away from the camera's position at the time of running
localPlayer:Move(Vector3.new(0, 0, -50), true)

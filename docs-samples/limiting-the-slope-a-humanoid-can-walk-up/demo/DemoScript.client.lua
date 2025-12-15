local player = game.Players.LocalPlayer
local char = player.CharacterAdded:wait()
local h = char:FindFirstChild("Humanoid")

h.MaxSlopeAngle = 30

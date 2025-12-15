local Players = game:GetService("Players")

for _, player in pairs(Players:GetPlayers()) do
	print(player:DistanceFromCharacter(Vector3.new(0, 0, 0)))
end

local Players = game:GetService("Players")

local player = Players.LocalPlayer

if player.MembershipType == Enum.MembershipType.Premium then
	-- Take some action specifically for Premium members
	print(player.Name .. " is a premium user!")
end

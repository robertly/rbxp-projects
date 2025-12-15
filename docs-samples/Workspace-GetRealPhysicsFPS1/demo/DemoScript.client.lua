local Players = game:GetService("Players")

local player = Players.LocalPlayer

while task.wait(1) do
	if workspace:GetRealPhysicsFPS() > 65 then
		player:Kick()
	end
end

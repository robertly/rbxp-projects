local RunService = game:GetService("RunService")

local LOOP_COUNT = 5
local count = 0

local connection

function onHeartbeat(step)
	if count < LOOP_COUNT then
		count = count + 1
		print("Time between each loop: " .. step)
	else
		connection:Disconnect()
	end
end

connection = RunService.Heartbeat:Connect(onHeartbeat)

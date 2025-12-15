local RunService = game:GetService("RunService")

if RunService:IsStudio() then
	print("I am in Roblox Studio")
else
	print("I am in an online Roblox Server")
end

if RunService:IsRunMode() then
	print("Running in Studio")
end

if RunService:IsClient() then
	print("I am a client")
else
	print("I am not a client")
end

if RunService:IsServer() then
	print("I am a server")
else
	print("I am not a server")
end

if RunService:IsRunning() then
	print("The game is running")
else
	print("The game is stopped or paused")
end

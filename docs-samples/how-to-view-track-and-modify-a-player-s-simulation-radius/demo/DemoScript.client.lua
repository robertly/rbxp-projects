local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Set the maximum simulation radius (default is 1000)
player.MaximumSimulationsRadius = 800

local change = -20
while true do
	change = change * -1
	player.SimulationRadius = player.SimulationRadius + change
	task.wait(5)
end

-- Print the updated simulation radius
player.SimulationRadiusChanged:Connect(function(radius)
	print("The new simulation radius is: " .. radius .. "studs")
end)

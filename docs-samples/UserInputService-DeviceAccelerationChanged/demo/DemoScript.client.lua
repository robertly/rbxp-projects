local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local SENSITIVITY = 0.2

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local ready = true

local function changeAcceleration(acceleration)
	if ready then
		ready = false
		local accel = acceleration.Position

		if accel.Y >= SENSITIVITY then
			humanoid.Jump = true
		end

		if accel.Z <= -SENSITIVITY then
			humanoid:Move(Vector3.new(-1, 0, 0))
		end
		if accel.Z >= SENSITIVITY then
			humanoid:Move(Vector3.new(1, 0, 0))
		end
		if accel.X <= -SENSITIVITY then
			humanoid:Move(Vector3.new(0, 0, 1))
		end
		if accel.X >= SENSITIVITY then
			humanoid:Move(Vector3.new(0, 0, -1))
		end
		task.wait(1)
		ready = true
	end
end

UserInputService.DeviceAccelerationChanged:Connect(changeAcceleration)

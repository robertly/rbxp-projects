local Workspace = game:GetService("Workspace")

-- create a sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.Parent = Workspace

if not sound.IsLoaded then
	sound.Loaded:Wait()
end

-- listen for events
sound.Played:Connect(function(_soundId)
	print("Sound.Played event")
end)

sound.Paused:Connect(function(_soundId)
	print("Sound.Paused event")
end)

sound.Resumed:Connect(function(_soundId)
	print("Sound.Resumed event")
end)

sound.Stopped:Connect(function(_soundId)
	print("Sound.Stopped event")
end)

sound:Play()
print("play", sound.Playing, sound.TimePosition) -- play true 0

task.wait(10)

sound:Pause()
print("pause", sound.Playing, sound.TimePosition) -- pause false 10

task.wait(3)

sound:Resume()
print("play", sound.Playing, sound.TimePosition) -- play true 10

task.wait(3)

sound:Stop()
print("stop", sound.Playing, sound.TimePosition) -- stop false 0

task.wait(3)

sound:Play()
print("play", sound.Playing, sound.TimePosition) -- play true 0

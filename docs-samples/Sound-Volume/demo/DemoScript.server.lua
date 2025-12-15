local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.Looped = true
sound.PlaybackSpeed = 2
sound.Parent = workspace

sound.Volume = 2

sound:Play()

task.wait(7)

sound.Volume = 0.2

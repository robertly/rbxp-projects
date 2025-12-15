local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.Looped = true
sound.Parent = workspace

sound:Play()
task.wait(10)
sound.PlaybackSpeed = 3 -- 3x faster
task.wait(5)
sound.PlaybackSpeed = 0.5 -- 2x slower
task.wait(5)
sound.PlaybackSpeed = 1 -- default

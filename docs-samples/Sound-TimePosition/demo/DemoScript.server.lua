local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.Parent = workspace

sound.TimePosition = 30

sound:Play()

task.wait(5)

sound.TimePosition = 100

task.wait(5)

sound.TimePosition = 0

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.Looped = true
sound.Parent = workspace

if not sound.isLoaded then
	sound.Loaded:Wait()
end

sound:Play()
print(sound.IsPlaying, sound.IsPaused) -- true, false

task.wait(2)
sound:Pause()
print(sound.IsPlaying, sound.IsPaused) -- false, true

task.wait(2)
sound:Play()
print(sound.IsPlaying, sound.IsPaused) -- true, false

task.wait(2)
sound:Stop()
print(sound.IsPlaying, sound.IsPaused) -- false, true

local SoundService = game:GetService("SoundService")

-- create a sound group
local soundGroup = Instance.new("SoundGroup")
soundGroup.Parent = SoundService

-- create a sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.Looped = true
sound.PlaybackSpeed = 2
sound.SoundGroup = soundGroup
sound.Parent = workspace

-- play the sound
sound:Play()

task.wait(10)

-- change the volume
soundGroup.Volume = 0.1

task.wait(3)

-- return the volume
soundGroup.Volume = 0.5

task.wait(4)

-- add a sound effect
local reverb = Instance.new("ReverbSoundEffect")
reverb.Parent = soundGroup

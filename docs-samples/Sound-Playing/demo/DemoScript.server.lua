local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.Looped = true
sound.Parent = workspace

print("playing sound")
sound.Playing = true

task.wait(10)

print("stopping sound")
sound.Playing = false

task.wait(5)

sound.Playing = true
local timePosition = sound.TimePosition
print("resumed at time position: " .. tostring(timePosition)) -- c. 10 seconds

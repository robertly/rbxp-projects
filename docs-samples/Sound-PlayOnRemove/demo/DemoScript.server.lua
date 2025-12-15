local sound = Instance.new("Sound")
sound.Name = "TestSound"
sound.SoundId = "rbxasset://sounds/uuhhh.mp3" -- oof
sound.Parent = workspace

sound.PlayOnRemove = true

task.wait(3)

sound:Destroy()

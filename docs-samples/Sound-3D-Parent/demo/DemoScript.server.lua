local part = Instance.new("Part")
part.Anchored = true
part.Position = Vector3.new(0, 3, 0)
part.BrickColor = BrickColor.new("Bright red")
part.Name = "MusicBox"
part.Parent = workspace

-- create a sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9120386436"
sound.EmitterSize = 5 -- decrease the emitter size (for earlier volume drop off)
sound.Looped = true
sound.Parent = part

local clickDetector = Instance.new("ClickDetector")
clickDetector.Parent = part

-- toggle the sound playing / not playing
clickDetector.MouseClick:Connect(function()
	if not sound.IsPlaying then
		part.BrickColor = BrickColor.new("Bright green")
		sound:Play()
	else
		part.BrickColor = BrickColor.new("Bright red")
		sound:Stop()
	end
end)

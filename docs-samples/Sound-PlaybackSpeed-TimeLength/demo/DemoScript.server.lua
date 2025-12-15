local function playForDuration(sound, duration)
	if not sound.IsLoaded then
		sound.Loaded:wait()
	end
	local speed = sound.TimeLength / duration
	sound.PlaybackSpeed = speed
	sound:Play()
end

local sound = script.Parent
playForDuration(sound, 5)

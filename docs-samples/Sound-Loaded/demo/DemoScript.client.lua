local sound = script.Parent.Sound

if not sound.IsLoaded then
	sound.Loaded:Wait()
end

print("The sound has loaded!")

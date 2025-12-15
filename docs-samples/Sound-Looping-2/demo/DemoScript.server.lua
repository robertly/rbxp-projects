local function loopNTimes(sound, numberOfLoops)
	if not sound.IsPlaying then
		sound.Looped = true
		local connection = nil
		connection = sound.DidLoop:Connect(function(_soundId, numOfTimesLooped)
			print(numOfTimesLooped)
			if numOfTimesLooped >= numberOfLoops then
				-- disconnect the connection
				connection:Disconnect()
				-- stop the sound
				sound:Stop()
			end
		end)
		sound:Play()
	end
end

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://0"

loopNTimes(sound, 5)

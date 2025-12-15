--!strict

--[[
	Audio objects can be tagged with the PlayAudioImmediately tagged and this component will play their audio
	as soon as the object is tagged.
--]]

local PlayAudioImmediately = {}
PlayAudioImmediately.__index = PlayAudioImmediately

export type ClassType = typeof(setmetatable(
	{} :: {
		_instance: Model,
	},
	PlayAudioImmediately
))

function PlayAudioImmediately.new(audioInstance: AudioPlayer & Sound): ClassType
	local self = {
		_instance = audioInstance,
	}

	setmetatable(self, PlayAudioImmediately)

	audioInstance:Play()

	return self
end

function PlayAudioImmediately.destroy(self: ClassType) end

return PlayAudioImmediately

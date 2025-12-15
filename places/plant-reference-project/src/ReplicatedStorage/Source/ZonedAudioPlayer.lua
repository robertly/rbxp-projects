--!strict

--[[
	Plays audio when any player enters a zone with audio specified to play in that zone.
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local AudioByZoneId = require(ReplicatedStorage.Source.SharedConstants.AudioByZoneId)

local ZonedAudioPlayer = {}
ZonedAudioPlayer._started = false

function ZonedAudioPlayer.start()
	assert(not ZonedAudioPlayer._started, "ZonedAudioPlayer started more than once")
	ZonedAudioPlayer._started = true
	ZonedAudioPlayer._listenForZoneChange()
end

function ZonedAudioPlayer._listenForZoneChange()
	-- Play the associated audio while something is inside the zone
	for zoneId, audioPlayers in AudioByZoneId do
		CollectionService:GetInstanceAddedSignal(zoneId):Connect(function(_instance)
			for _, audioPlayer in audioPlayers do
				audioPlayer:Play()
			end
		end)
		CollectionService:GetInstanceRemovedSignal(zoneId):Connect(function(_instance)
			for _, audioPlayer in audioPlayers do
				audioPlayer:Stop()
				audioPlayer.TimePosition = audioPlayer.PlaybackRegion.Min
			end
		end)
	end
end

return ZonedAudioPlayer

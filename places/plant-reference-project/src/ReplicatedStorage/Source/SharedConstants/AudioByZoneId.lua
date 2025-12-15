--!strict

--[[
	A mapping of ZoneIds to Audio objects to play a sound when a player enters the zone.
	Used by ZonedAudioPlayer.
--]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local getInstance = require(ReplicatedStorage.Source.Utility.getInstance)

local ZoneIdTag = require(ReplicatedStorage.Source.SharedConstants.CollectionServiceTag.ZoneIdTag)

local marketRoosterNPC = getInstance(Workspace, "World", "MarketArea", "Vendors", "Market", "RoosterNPCMarket")
local marketRoosterNPCSound = getInstance(marketRoosterNPC.PrimaryPart :: BasePart, "AudioEmitter", "BirdHello1")
local supplyRoosterNPC = getInstance(Workspace, "World", "MarketArea", "Vendors", "GardenSupply", "RoosterNPCSupply")
local supplyRoosterNPCSound = getInstance(supplyRoosterNPC.PrimaryPart :: BasePart, "AudioEmitter", "BirdHello2")
local storeRoosterNPC = getInstance(Workspace, "World", "MarketArea", "Vendors", "Store", "RoosterNPCStore")
local storeRoosterNPCSound = getInstance(storeRoosterNPC.PrimaryPart :: BasePart, "AudioEmitter", "BirdHello3")

local AudioByZoneId: { [ZoneIdTag.EnumType]: { AudioPlayer } } = {
	[ZoneIdTag.InShop] = { storeRoosterNPCSound },
	[ZoneIdTag.InGardenStore] = { supplyRoosterNPCSound },
	[ZoneIdTag.InMarket] = { marketRoosterNPCSound },
}

return AudioByZoneId

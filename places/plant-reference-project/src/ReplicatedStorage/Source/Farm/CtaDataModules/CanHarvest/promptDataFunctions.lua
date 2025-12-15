--!strict

--[[
	Defines ProximityPrompt functionality via callbacks for the CanHarvest cta
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Network = require(ReplicatedStorage.Source.Network)
local Attribute = require(ReplicatedStorage.Source.SharedConstants.Attribute)
local PlayerFacingString = require(ReplicatedStorage.Source.SharedConstants.PlayerFacingString)
local getAttribute = require(ReplicatedStorage.Source.Utility.getAttribute)

local RemoteEvents = Network.RemoteEvents

local promptDataFunctions = {
	getActionText = function(promptParent: Instance)
		return PlayerFacingString.CallToAction.HarvestPlant
	end,

	getObjectText = function(promptParent: Instance)
		return getAttribute(promptParent, Attribute.DisplayName) :: string
	end,

	onTriggered = function(promptParent: Instance)
		local plantModel = promptParent
		Network.fireServer(RemoteEvents.PlantHarvested, plantModel)
	end,
}

return promptDataFunctions

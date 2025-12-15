--[[
	Instance attribute names used by GUIs

	'selectedIndex' is the index of the selected blaster, set on PickABlasterGui.
	'teamPoints' is the number of points the team has, set on a Team in Teams service.
	'teamColor' is the color associated with the gui element, set on team-related objects in HUDGui.
--]]

local GuiAttribute = {
	selectedIndex = "selectedIndex",
	teamPoints = "teamPoints",
	teamColor = "teamColor",
}

return GuiAttribute

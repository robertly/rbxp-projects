--[[
	Updates the objective text to display the team score limit,
	which is configured in ReplicatedStorage.TEAM_SCORE_LIMIT.
	
	The text label's text contains %d, which gets replaced with the score limit at runtime.
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TEAM_SCORE_LIMIT = require(ReplicatedStorage.TEAM_SCORE_LIMIT)

local function setObjective(gui: ScreenGui)
	local bodyTextLabel = gui.Objective.ObjectiveDisplay.Body.BodyTextLabel
	bodyTextLabel.Text = bodyTextLabel.Text:format(TEAM_SCORE_LIMIT)
end

return setObjective

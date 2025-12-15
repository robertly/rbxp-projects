local ReplicatedStorage = game:GetService("ReplicatedStorage")

local stopBallMovement = require(ReplicatedStorage.stopBallMovement)
local getPlayerFromSeat = require(ReplicatedStorage.getPlayerFromSeat)

local function toggleBallControl(ball: Model, isEnabled: boolean)
	local player = getPlayerFromSeat(ball.DriverSeat)
	local toggleInputControlsRemoteEvent = ball.Events.ToggleInputControlsRemoteEvent

	if not isEnabled then
		-- Zero out velocity applied to the ball
		stopBallMovement(ball)

		-- Disable the player's input
		if player then
			toggleInputControlsRemoteEvent:FireClient(player, false)
		end
	else
		-- Enable the player's input
		if player then
			toggleInputControlsRemoteEvent:FireClient(player, true)
		end
	end
end

return toggleBallControl

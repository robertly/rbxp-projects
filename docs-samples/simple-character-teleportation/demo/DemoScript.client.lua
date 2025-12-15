-- This code should be placed in a LocalScript under StarterPlayerScripts
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")

local player = Players.LocalPlayer

local function doTeleport(_actionName, inputState, _inputObject)
	local character = player.Character
	if character and character.Parent and inputState == Enum.UserInputState.Begin then
		-- Move the character 10 studs forwards in the direction they're facing
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(0, 0, -10))
	end
end

ContextActionService:BindAction("Teleport", doTeleport, true, Enum.KeyCode.F)

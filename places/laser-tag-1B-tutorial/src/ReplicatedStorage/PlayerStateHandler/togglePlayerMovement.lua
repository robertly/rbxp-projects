--[[
	Provides the ability to toggle between allowing and prevent the player from moving their character.
--]]

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ENABLED_JUMP_HEIGHT = 7.2
local ENABLED_WALK_SPEED = 16

local function togglePlayerMovement(isEnabled: boolean)
	local character = player.Character
	local humanoid = character:WaitForChild("Humanoid", 3)
	if not humanoid then
		-- Spawning was probably canceled for this character
		return
	end

	if not isEnabled then
		humanoid.JumpHeight = 0
		humanoid.WalkSpeed = 0
	else
		humanoid.JumpHeight = ENABLED_JUMP_HEIGHT
		humanoid.WalkSpeed = ENABLED_WALK_SPEED
	end
end

return togglePlayerMovement

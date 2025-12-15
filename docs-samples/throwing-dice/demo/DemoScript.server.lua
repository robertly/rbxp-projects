local die1 = script.Parent.Die1
local die2 = script.Parent.Die2

local DIE_1_RESET_CFRAME = die1.CFrame
local DIE_2_RESET_CFRAME = die2.CFrame

local THROW_HEIGHT_IMPULSE = 3000
local THROW_ANGULAR_IMPULSE = 1000

local function rollDie(die: UnionOperation)
	-- Randomize the amount of angular impulse
	local angularX = math.random(5, 15)
	local angularY = math.random(5, 15)
	local angularZ = math.random(5, 15)

	-- Apply an angular impulse to get the dice to spin
	die:ApplyAngularImpulse(Vector3.new(angularX, angularY, angularZ) * THROW_ANGULAR_IMPULSE)

	-- Apply an upward impulse to get the dice in the air
	die:ApplyImpulse(Vector3.yAxis * THROW_HEIGHT_IMPULSE)
end

while true do
	task.wait(3)
	rollDie(die1)
	rollDie(die2)

	-- Wait for the dice to finish rolling, then reset their position to throw again
	task.wait(5)
	die1.CFrame = DIE_1_RESET_CFRAME
	die2.CFrame = DIE_2_RESET_CFRAME
end

local RunService = game:GetService("RunService")

local emitter = script.Parent
local part = emitter.Parent

local PARTICLES_PER_STUD = 3

local lastPosition = part.Position
local distance = 0
local function onStep()
	local displacement = part.Position - lastPosition
	distance = distance + displacement.magnitude

	local n = math.floor(distance * PARTICLES_PER_STUD)
	emitter:Emit(n)
	distance = distance - n / PARTICLES_PER_STUD
	lastPosition = part.Position
end

RunService.Stepped:Connect(onStep)
emitter.Enabled = false

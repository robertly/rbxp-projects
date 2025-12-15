local part = script.Parent

-- This will make the part light and bouncy!
local DENSITY = 0.3
local FRICTION = 0.1
local ELASTICITY = 1
local FRICTION_WEIGHT = 1
local ELASTICITY_WEIGHT = 1

local physProperties = PhysicalProperties.new(DENSITY, FRICTION, ELASTICITY, FRICTION_WEIGHT, ELASTICITY_WEIGHT)
part.CustomPhysicalProperties = physProperties

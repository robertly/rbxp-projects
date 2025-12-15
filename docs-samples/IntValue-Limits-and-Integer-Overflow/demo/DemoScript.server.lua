-- These are the constraints for a 32-bit signed integer
local INT_MAX = 2 ^ 31 - 1
local INT_MIN = -(2 ^ 31)

local vInteger = Instance.new("IntValue")
vInteger.Changed:Connect(print)
-- Some small values
vInteger.Value = 5
vInteger.Value = 0
vInteger.Value = -0 -- No change - same as 0
-- Min value
vInteger.Value = INT_MIN
-- Max value
vInteger.Value = INT_MAX
-- Max value plus one; this causes integer overflow!
-- The IntValue changes to INT_MIN!
vInteger.Value = INT_MAX + 1

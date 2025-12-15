--- Vector3Curve
local function createVector3Curve()
	local vectorCurve = Instance.new("Vector3Curve")
	local curveX = vectorCurve:X() -- creates and returns a FloatCurve animating the X channel
	local curveY = vectorCurve:Y() -- creates and returns a FloatCurve animating the Y channel
	-- Not setting the Z channel will leave the Z channel not animated.
	-- A missing curve or a curve with no keys don't participate in the animation

	local key = FloatCurveKey.new(0, 1, Enum.KeyInterpolationMode.Cubic) -- creates a key at time 0 and with value 1
	curveX:InsertKey(key)
	curveY:InsertKey(key)
	local key2 = FloatCurveKey.new(1, 2, Enum.KeyInterpolationMode.Cubic) -- creates a key at time 1 and with value 2
	curveX:InsertKey(key2)
	curveY:InsertKey(key2)
	return vectorCurve
end

local function testVector3Curve()
	local curve = createVector3Curve()

	-- sampling the curve at a given time (returns a vector3)
	print(curve:GetValueAtTime(0)) -- returns 1, 1, void
	print(curve:GetValueAtTime(0.5)) -- returns 1.5, 1.5, void (result of cubic interpolation with auto tangents)

	curve:X():RemoveKeyAtIndex(1)
	curve:X():RemoveKeyAtIndex(1)
	print(curve:X().Length) -- number of keys = 0
	print(curve:GetValueAtTime(0.5)) -- returns void, 1.5, void
end

testVector3Curve()

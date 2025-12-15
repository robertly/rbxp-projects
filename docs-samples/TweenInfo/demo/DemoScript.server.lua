-- A TweenInfo with all default parameters
local _tweenInfo = TweenInfo.new()

-- A TweenInfo with its time set to 0.5 seconds.
local _tweenInfo = TweenInfo.new(0.5)

-- A TweenInfo with its easing style set to Back.
local _tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back)

-- A TweenInfo with its easing direction set to In.
local _tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In)

-- A TweenInfo that repeats itself 4 times.
local _tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In, 4)

-- A TweenInfo that reverses its interpolation after reaching its goal.
local _tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In, 4, true)

-- A TweenInfo that loops indefinitely.
local _tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In, -1, true)

-- A TweenInfo with a delay of 1 second between each interpolation.
local _tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In, 4, true, 1)

local TweenService = game:GetService("TweenService")

local function isInstanceAPart(tween)
	local instance = tween.Instance
	return instance:IsA("BasePart")
end

local tweenInfo = TweenInfo.new()
local instance = Instance.new("Part")

local tween = TweenService:Create(instance, tweenInfo, {
	Transparency = 1,
})

print(isInstanceAPart(tween))

local part = Instance.new("Part")

local function onBrickColorChanged()
	print("My color is now " .. part.BrickColor.Name)
end

local function onChanged(property)
	if property == "BrickColor" then
		onBrickColorChanged()
	end
end

part:GetPropertyChangedSignal("BrickColor"):Connect(onBrickColorChanged)
part.Changed:Connect(onChanged)

-- Trigger some changes (because we connected twice,
-- both of these will cause two calls to onBrickColorChanged)
part.BrickColor = BrickColor.new("Really red")
part.BrickColor = BrickColor.new("Institutional white")

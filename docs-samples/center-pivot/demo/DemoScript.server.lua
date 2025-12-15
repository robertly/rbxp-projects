local modelPrimaryPart = script.Parent.ModelPrimaryPart
local model = script.Parent.Model

local function centerPivot(m: Model)
	local boundsCFrame = m:GetBoundingBox()
	-- If a PrimaryPart is set, the model should use PivotOffset since the pivot becomes relative to that part
	-- Otherwise, use WorldPivot to define the precise world location
	if m.PrimaryPart then
		m.PrimaryPart.PivotOffset = m.PrimaryPart.CFrame:ToObjectSpace(boundsCFrame)
	else
		m.WorldPivot = boundsCFrame
	end
end

local function getPivotPosition(m: Model)
	if m.PrimaryPart then
		return m.PrimaryPart.PivotOffset.Position
	else
		return m.WorldPivot.Position
	end
end

print(modelPrimaryPart.Name, "pivot position before:", getPivotPosition(modelPrimaryPart))
centerPivot(modelPrimaryPart)
print(modelPrimaryPart.Name, "pivot position after:", getPivotPosition(modelPrimaryPart))

print(model.Name, "pivot position before:", getPivotPosition(model))
centerPivot(model)
print(model.Name, "pivot position after:", getPivotPosition(model))

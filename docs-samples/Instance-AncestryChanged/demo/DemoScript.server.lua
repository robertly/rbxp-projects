local Workspace = game:GetService("Workspace")

local redPart = script.Parent.RedPart
local bluePart = script.Parent.BluePart
local changingPart = script.Parent.ChangingPart

-- Change the color of changingPart based on it's Parent
local function onAncestryChanged(part: Part, parent: Instance)
	if parent == redPart then
		changingPart.Color = Color3.new(1, 0, 0)
	elseif parent == bluePart then
		changingPart.Color = Color3.new(0, 0, 1)
	else
		changingPart.Color = Color3.new(1, 1, 1)
	end
	print(`{part.Name} is now parented to {parent.Name}`)
end

changingPart.AncestryChanged:Connect(onAncestryChanged)

-- Set changingPart's Parent property to different instances over time
while true do
	task.wait(2)
	changingPart.Parent = redPart

	task.wait(2)
	changingPart.Parent = bluePart

	task.wait(2)
	changingPart.Parent = Workspace
end

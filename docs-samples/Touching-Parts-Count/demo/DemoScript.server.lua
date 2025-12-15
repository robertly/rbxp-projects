local part = script.Parent

local billboardGui = Instance.new("BillboardGui")
billboardGui.Size = UDim2.new(0, 200, 0, 50)
billboardGui.Adornee = part
billboardGui.AlwaysOnTop = true
billboardGui.Parent = part

local tl = Instance.new("TextLabel")
tl.Size = UDim2.new(1, 0, 1, 0)
tl.BackgroundTransparency = 1
tl.Parent = billboardGui

local numTouchingParts = 0

local function onTouch(otherPart)
	print("Touch started: " .. otherPart.Name)
	numTouchingParts = numTouchingParts + 1
	tl.Text = numTouchingParts
end

local function onTouchEnded(otherPart)
	print("Touch ended: " .. otherPart.Name)
	numTouchingParts = numTouchingParts - 1
	tl.Text = numTouchingParts
end

part.Touched:Connect(onTouch)
part.TouchEnded:Connect(onTouchEnded)

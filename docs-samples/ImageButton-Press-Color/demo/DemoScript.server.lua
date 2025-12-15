-- Place this code in a LocalScript in an ImageButton
local imageButton = script.Parent

local colorNormal = Color3.new(1, 1, 1) -- white
local colorHover = Color3.new(0, 1, 0) -- green
local colorPress = Color3.new(1, 0, 0) -- red

-- This is a 32x32 image of a backpack
imageButton.Image = "rbxassetid://787458668"
imageButton.BackgroundTransparency = 1

local function onActivated()
	print("open the inventory")
end

local function onPressed()
	imageButton.ImageColor3 = colorPress
end

local function onReleased()
	imageButton.ImageColor3 = colorHover
end

local function onEntered()
	imageButton.ImageColor3 = colorHover
end

local function onLeft()
	imageButton.ImageColor3 = colorNormal
end

imageButton.MouseEnter:Connect(onEntered)
imageButton.MouseLeave:Connect(onLeft)
imageButton.MouseButton1Down:Connect(onPressed)
imageButton.MouseButton1Up:Connect(onReleased)
imageButton.Activated:Connect(onActivated)

-- Start with the default, non-hovered state
onLeft()

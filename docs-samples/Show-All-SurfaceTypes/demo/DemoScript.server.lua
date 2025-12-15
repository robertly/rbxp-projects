local demoPart = script.Parent

-- Create a billboard gui to display what the current surface type is
local billboard = Instance.new("BillboardGui")
billboard.AlwaysOnTop = true
billboard.Size = UDim2.new(0, 200, 0, 50)
billboard.Adornee = demoPart
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 200, 0, 50)
textLabel.BackgroundTransparency = 1
textLabel.TextStrokeTransparency = 0
textLabel.TextColor3 = Color3.new(1, 1, 1) -- White
textLabel.Parent = billboard
billboard.Parent = demoPart

local function setAllSurfaces(part, surfaceType)
	part.TopSurface = surfaceType
	part.BottomSurface = surfaceType
	part.LeftSurface = surfaceType
	part.RightSurface = surfaceType
	part.FrontSurface = surfaceType
	part.BackSurface = surfaceType
end

while true do
	-- Iterate through the different SurfaceTypes
	for _, enum in pairs(Enum.SurfaceType:GetEnumItems()) do
		textLabel.Text = enum.Name
		setAllSurfaces(demoPart, enum)
		task.wait(1)
	end
end

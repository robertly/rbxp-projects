local part = script.Parent

local clickDetector = Instance.new("ClickDetector")
clickDetector.Parent = part

local fire = Instance.new("Fire")
fire.Parent = part

local light = Instance.new("PointLight")
light.Parent = part

local function onClick()
	fire.Enabled = not fire.Enabled
	light.Enabled = fire.Enabled
end

clickDetector.MouseClick:Connect(onClick)

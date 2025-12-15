local imageLabel = script.Parent

-- The images in this example are 64x64
imageLabel.Size = UDim2.new(0, 64, 0, 64)

local function unlock()
	imageLabel.Image = "rbxassetid://284402785" -- Unlocked padlock (64x64)
	imageLabel.ImageColor3 = Color3.new(0, 0.5, 0) -- Dark green
end

local function lock()
	imageLabel.Image = "rbxassetid://284402752" -- Locked padlock (64x64)
	imageLabel.ImageColor3 = Color3.new(0.5, 0, 0) -- Dark red
end

-- Connect events; our default state is locked
imageLabel.MouseEnter:Connect(unlock)
imageLabel.MouseLeave:Connect(lock)
lock()

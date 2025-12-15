local part = script.Parent

local pointLight = Instance.new("PointLight")
pointLight.Brightness = 0
pointLight.Range = 12
pointLight.Parent = part

local touchNo = 0
local function blink()
	-- Advance touchNo to tell other blink() calls to stop early
	touchNo = touchNo + 1
	-- Save touchNo locally so we can tell when it changes globally
	local myTouchNo = touchNo
	for i = 1, 0, -0.1 do
		-- Stop early if another blink started
		if touchNo ~= myTouchNo then
			break
		end
		-- Update the blink animation
		part.Reflectance = i
		pointLight.Brightness = i * 2
		task.wait(0.05)
	end
end

part.Touched:Connect(blink)

local character = script.Parent

local humanoid = character:WaitForChild("Humanoid")

local partInfo = {}

local debounce = false

local function onHumanoidTouched(hit, _limb)
	if debounce then
		return
	end

	if not hit.CanCollide or hit.Transparency ~= 0 then
		return
	end

	if not partInfo[hit] then
		partInfo[hit] = {
			BrickColor = hit.BrickColor,
			Material = hit.Material,
		}

		hit.BrickColor = BrickColor.new("Gold")
		hit.Material = Enum.Material.Ice

		debounce = true
		task.wait(0.2)
		debounce = false
	end
end

local touchedConnection = humanoid.Touched:Connect(onHumanoidTouched)

local function onHumanoidDied()
	if touchedConnection then
		touchedConnection:Disconnect()
	end

	-- undo all of the gold
	for part, info in pairs(partInfo) do
		if part and part.Parent then
			part.BrickColor = info.BrickColor
			part.Material = info.Material
		end
	end
end

humanoid.Died:Connect(onHumanoidDied)

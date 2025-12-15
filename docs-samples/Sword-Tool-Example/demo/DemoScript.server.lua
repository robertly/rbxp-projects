local tool = script.Parent

local function onTouch(partOther)
	-- First, try to see if the part we touched was part of a Humanoid
	local humanOther = partOther.Parent:FindFirstChild("Humanoid")
	-- Ignore touches by non-humanoids
	if not humanOther then
		return
	end

	-- Ignore touches by the Humanoid carrying the sword
	if humanOther.Parent == tool.Parent then
		return
	end

	humanOther:TakeDamage(5)
end

-- Trigger a slash animation
local function slash()
	-- Default character scripts will listen for a "toolanim" StringValue
	local value = Instance.new("StringValue")
	value.Name = "toolanim"
	value.Value = "Slash" -- try also: Lunge
	value.Parent = tool
end

tool.Activated:Connect(slash)
tool.Handle.Touched:Connect(onTouch)

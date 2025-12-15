-- Paste me in a Script inside a Part
local part = script.Parent

local teleportPosition = part.TeleportPosition

local function onTouch(otherPart)
	-- First, find the HumanoidRootPart. If we can't find it, exit.
	local hrp = otherPart.Parent:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return
	end

	-- Now teleport by setting the CFrame to one created from
	-- the stored TeleportPosition
	hrp.CFrame = CFrame.new(teleportPosition.Value)
end

part.Touched:Connect(onTouch)

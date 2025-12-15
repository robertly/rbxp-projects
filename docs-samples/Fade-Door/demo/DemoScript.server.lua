-- Paste into a Script inside a tall part
local part = script.Parent

local OPEN_TIME = 1

-- Can the door be opened at the moment?
local debounce = false

local function open()
	part.CanCollide = false
	part.Transparency = 0.7
	part.BrickColor = BrickColor.new("Black")
end

local function close()
	part.CanCollide = true
	part.Transparency = 0
	part.BrickColor = BrickColor.new("Bright blue")
end

local function onTouch(otherPart)
	-- If the door was already open, do nothing
	if debounce then
		print("D")
		return
	end

	-- Check if touched by a Humanoid
	local human = otherPart.Parent:FindFirstChildOfClass("Humanoid")
	if not human then
		print("not human")
		return
	end

	-- Perform the door opening sequence
	debounce = true
	open()
	task.wait(OPEN_TIME)
	close()
	debounce = false
end

part.Touched:Connect(onTouch)
close()

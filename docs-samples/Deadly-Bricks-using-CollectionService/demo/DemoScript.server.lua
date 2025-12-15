local CollectionService = game:GetService("CollectionService")

local tag = "Deadly"

local function onDeadlyPartTouched(otherPart)
	if not otherPart.Parent then
		return
	end
	local human = otherPart.Parent:FindFirstChildOfClass("Humanoid")
	if human then
		human.Health = 0
	end
end

-- Save the connections so they can be disconnected when the tag is removed
-- This table maps BaseParts with the tag to their Touched connections
local connections = {}

local function onInstanceAdded(object)
	-- Remember that any tag can be applied to any object, so there's no
	-- guarantee that the object with this tag is a BasePart.
	if object:IsA("BasePart") then
		connections[object] = object.Touched:Connect(onDeadlyPartTouched)
	end
end

local function onInstanceRemoved(object)
	-- If we made a connection on this object, disconnect it (prevent memory leaks)
	if connections[object] then
		connections[object]:Disconnect()
		connections[object] = nil
	end
end

-- Listen for this tag being applied to objects
CollectionService:GetInstanceAddedSignal(tag):Connect(onInstanceAdded)
CollectionService:GetInstanceRemovedSignal(tag):Connect(onInstanceRemoved)

-- Also detect any objects that already have the tag
for _, object in pairs(CollectionService:GetTagged(tag)) do
	onInstanceAdded(object)
end

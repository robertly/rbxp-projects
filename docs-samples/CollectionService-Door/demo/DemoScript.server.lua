local CollectionService = game:GetService("CollectionService")

local Door = {}
Door.__index = Door
Door.TAG_NAME = "Door"
Door.OPEN_TIME = 2

function Door.new(door)
	-- Create a table which will act as our new door object.
	local self = {}
	-- Setting the metatable allows the table to access
	-- the SetOpen, OnTouch and Cleanup methods even if we did not
	-- add all of the functions ourself - this is because the
	-- __index metamethod is set in the Door metatable.
	setmetatable(self, Door)

	-- Keep track of some door properties of our own
	self.door = door
	self.debounce = false

	-- Initialize a Touched event to call a method of the door
	self.touchConn = door.Touched:Connect(function(...)
		self:OnTouch(...)
	end)

	-- Initialize the state of the door
	self:SetOpen(false)

	print("Initialized door: " .. door:GetFullName())

	return self
end

function Door:SetOpen(isOpen)
	if isOpen then
		self.door.Transparency = 0.75
		self.door.CanCollide = false
	else
		self.door.Transparency = 0
		self.door.CanCollide = true
	end
end

function Door:OnTouch(part)
	if self.debounce then
		return
	end
	local human = part.Parent:FindFirstChild("Humanoid")
	if not human then
		return
	end
	self.debounce = true
	self:SetOpen(true)
	task.wait(Door.OPEN_TIME)
	self:SetOpen(false)
	self.debounce = false
end

function Door:Cleanup()
	self.touchConn:disconnect()
	self.touchConn = nil
end

local doors = {}

local doorAddedSignal = CollectionService:GetInstanceAddedSignal(Door.TAG_NAME)
local doorRemovedSignal = CollectionService:GetInstanceRemovedSignal(Door.TAG_NAME)

local function onDoorAdded(door)
	if door:IsA("BasePart") then
		-- Create a new Door object and save it
		-- The door class will take over from here!
		doors[door] = Door.new(door)
	end
end

local function onDoorRemoved(door)
	if doors[door] then
		doors[door]:Cleanup()
		doors[door] = nil
	end
end

-- Listen for existing tags, tag additions and tag removals for the door tag
for _, inst in pairs(CollectionService:GetTagged(Door.TAG_NAME)) do
	onDoorAdded(inst)
end
doorAddedSignal:Connect(onDoorAdded)
doorRemovedSignal:Connect(onDoorRemoved)

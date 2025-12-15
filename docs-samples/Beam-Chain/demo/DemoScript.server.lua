local function connectParts(...)
	-- build an array of parts given
	local parts = { ... }
	-- make sure there is more than one part
	if #parts > 1 then
		-- create a template beam
		local beam = Instance.new("Beam")
		-- can change beam properties here
		-- create an initial attachment in the first part
		local lastAttachment = Instance.new("Attachment")
		lastAttachment.Parent = parts[1]
		-- iterate through parts from the second part
		for i = 2, #parts do
			local part = parts[i]
			-- create an attachment in the part
			local nextAttachment = Instance.new("Attachment")
			nextAttachment.Parent = part
			-- hook the beam up
			local newBeam = beam:Clone()
			newBeam.Attachment0 = lastAttachment
			newBeam.Attachment1 = nextAttachment
			newBeam.Parent = lastAttachment
			-- set the last attachment
			lastAttachment = nextAttachment
		end
	end
end

local objects = script.Parent:GetDescendants()

local parts = {}

for _index, object in ipairs(objects) do
	if object:IsA("BasePart") then
		table.insert(parts, object)
	end
end

connectParts(parts)

local function generateKeyframe(model)
	if not model.PrimaryPart then
		warn("No primary part set")
		return
	end

	local rootPart = model.PrimaryPart:GetRootPart()

	if not rootPart then
		warn("Root part not found")
		return
	end

	local partsAdded = {}
	partsAdded[rootPart] = true

	local function addPoses(part, parentPose)
		-- get all of the joints attached to the part
		for _, joint in pairs(part:GetJoints()) do
			-- we're only interested in Motor6Ds
			if joint:IsA("Motor6D") then
				-- find the connected part
				local connectedPart = nil
				if joint.Part0 == part then
					connectedPart = joint.Part1
				elseif joint.Part1 == part then
					connectedPart = joint.Part0
				end
				if connectedPart then
					-- make sure we haven't already added this part
					if not partsAdded[connectedPart] then
						partsAdded[connectedPart] = true
						-- create a pose
						local pose = Instance.new("Pose")
						pose.Name = connectedPart.Name
						parentPose:AddSubPose(pose)
						-- recurse
						addPoses(connectedPart, pose)
					end
				end
			end
		end
	end

	local keyframe = Instance.new("Keyframe")

	-- populate the keyframe
	local rootPose = Instance.new("Pose")
	rootPose.Name = rootPart.Name
	addPoses(rootPart, rootPose)
	keyframe:AddPose(rootPose)

	return keyframe
end

local character = script.Parent

local keyframe = generateKeyframe(character)

print(keyframe)

local function resetPoses(parent)
	-- both functions are equivalent to GetChildren
	local poses = parent:IsA("Keyframe") and parent:GetPoses() or parent:IsA("Pose") and parent:GetSubPoses()

	for _, pose in pairs(poses) do
		if pose:IsA("Pose") then
			pose.CFrame = CFrame.new()
			-- recurse
			resetPoses(pose)
		end
	end
end

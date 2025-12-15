local part = workspace:FindFirstChild("Part")

if part and part:IsA("BasePart") then
	local canSet, errorReason = part:CanSetNetworkOwnership()
	if canSet then
		print(part:GetFullName() .. "'s Network Ownership can be changed!")
	else
		warn("Cannot change the Network Ownership of " .. part:GetFullName() .. " because: " .. errorReason)
	end
end

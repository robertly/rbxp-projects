local VRService = game:GetService("VRService")

VRService.UserCFrameEnabled:Connect(function(type, enabled)
	if enabled then
		print(type.Name .. " got enabled!")
	else
		print(type.Name .. " got disabled!")
	end
end)

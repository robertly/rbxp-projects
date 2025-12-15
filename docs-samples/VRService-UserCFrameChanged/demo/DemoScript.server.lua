local VRService = game:GetService("VRService")

VRService.UserCFrameChanged:Connect(function(userCFrameType, cframeValue)
	print(userCFrameType.Name .. " changed. Updated Frame: " .. tostring(cframeValue))
end)

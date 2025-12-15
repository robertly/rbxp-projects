local VRService = game:GetService("VRService")

local isEnabled = VRService:GetUserCFrameEnabled(Enum.UserCFrame.Head)
if isEnabled then
	print("VR device is enabled!")
else
	print("VR device is disabled!")
end

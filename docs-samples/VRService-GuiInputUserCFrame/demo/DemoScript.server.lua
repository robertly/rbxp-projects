local VRService = game:GetService("VRService")

if VRService.VREnabled then
	print(VRService.GuiInputUserCFrame.Name)
else
	print("No VR device detected!")
end

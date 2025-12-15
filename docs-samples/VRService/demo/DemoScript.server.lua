-- We must get the VRService before we can use it
local VRService = game:GetService("VRService")

-- A sample function providing one usage of UserCFrameChanged
local function userCFrameChanged(typ, value)
	print(typ.Name .. " changed. Updated Frame: " .. value)
end

VRService.UserCFrameChanged:Connect(userCFrameChanged)

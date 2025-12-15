local VRService = game:GetService("VRService")

VRService.TouchpadModeChanged:Connect(function(cframe, inputUserCFrame)
	print(inputUserCFrame.Name .. " made request with CFrame: " .. cframe)
end)

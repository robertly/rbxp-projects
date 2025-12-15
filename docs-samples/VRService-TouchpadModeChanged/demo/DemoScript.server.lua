local VRService = game:GetService("VRService")

VRService.NavigationRequested:Connect(function(pad, mode)
	print(pad.Name .. " Touchpad changed to state: " .. mode.Name)
end)

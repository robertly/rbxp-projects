local VRService = game:GetService("VRService")

local destination = workspace:FindFirstChild("NavigationDestination")

VRService:RequestNavigation(Enum.UserCFrame.Head, destination.CFrame)

local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local afkEvent = ReplicatedStorage:WaitForChild("AfkEvent")

local function focusGained()
	afkEvent:FireServer(false)
end

local function focusReleased()
	afkEvent:FireServer(true)
end

UserInputService.WindowFocused:Connect(focusGained)
UserInputService.WindowFocusReleased:Connect(focusReleased)

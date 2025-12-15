local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.CharacterAdded:Wait()
local head = character:WaitForChild("Head")

local function TrackHead(inputType, value)
	if inputType == Enum.UserCFrame.Head then
		head.CFrame = value
	end
end

if UserInputService.VREnabled then
	-- Set the inital CFrame
	head.CFrame = UserInputService:GetUserCFrame(Enum.UserCFrame.Head)

	-- Track VR headset movement and mirror for character's head
	UserInputService.UserCFrameChanged:Connect(TrackHead)
end

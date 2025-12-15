local Workspace = game:GetService("Workspace")
local VRService = game:GetService("VRService")

local camera = Workspace.CurrentCamera
local part = script.Parent.Part
local handOffset = VRService:GetUserCFrame(Enum.UserCFrame.LeftHand)

-- Account for headscale
handOffset = handOffset.Rotation + handOffset.Position * camera.HeadScale
part.CFrame = camera.CFrame * handOffset

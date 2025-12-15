local character = script.Parent.Character
local humanoid = character.Humanoid
local root = character.HumanoidRootPart

-- Create a new attachment to use as the IKControl.Target
local target = Instance.new("Attachment")
target.CFrame = CFrame.new(-1, 0, -1)
target.Parent = root

local ikControl = Instance.new("IKControl")
ikControl.Type = Enum.IKControlType.Position
ikControl.EndEffector = character.LeftHand
ikControl.ChainRoot = character.LeftUpperArm
ikControl.Target = target
ikControl.Parent = humanoid

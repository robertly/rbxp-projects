local InsertService = game:GetService("InsertService")

-- Load a model for demonstration
local npcModel = InsertService:LoadAsset(516159357):GetChildren()[1]
npcModel.Name = "NPC"
npcModel.PrimaryPart.Anchored = true
npcModel:SetPrimaryPartCFrame(CFrame.new(0, 5, 0))
npcModel.Parent = workspace

-- Replace the humanoid with an animationcontroller
local humanoid = npcModel:FindFirstChildOfClass("Humanoid")
humanoid:Destroy()
local animationController = Instance.new("AnimationController")
animationController.Parent = npcModel

-- Create and load an animation
local animation = Instance.new("Animation")
animation.AnimationId = "http://www.roblox.com/asset/?id=507771019" -- Roblox dance emote
local animationTrack = animationController:LoadAnimation(animation)

-- Play the animation
animationTrack:Play()

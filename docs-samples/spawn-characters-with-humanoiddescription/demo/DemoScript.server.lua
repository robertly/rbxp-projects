local Players = game:GetService("Players")

Players.CharacterAutoLoads = false

local function onPlayerAdded(player)
	local humanoidDescription = Instance.new("HumanoidDescription")
	humanoidDescription.HatAccessory = "2551510151,2535600138"
	humanoidDescription.BodyTypeScale = 0.1
	humanoidDescription.ClimbAnimation = 619521311
	humanoidDescription.Face = 86487700
	humanoidDescription.GraphicTShirt = 1711661
	humanoidDescription.HeadColor = Color3.new(0, 1, 0)
	player:LoadCharacterWithHumanoidDescription(humanoidDescription)
end

Players.PlayerAdded:Connect(onPlayerAdded)

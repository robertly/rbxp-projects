local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character

local tool = Instance.new("Tool")
tool.Name = "Invisibility Tool"
tool.RequiresHandle = false
tool.Parent = player.Backpack

local invisible = false

local function toolActivated()
	if invisible then
		return
	end
	invisible = true

	for _, bodypart in pairs(character:GetChildren()) do
		if bodypart:IsA("MeshPart") or bodypart:IsA("Part") then
			bodypart.Transparency = 1
		end
	end

	task.wait(3)
	tool:Deactivate()
	task.wait(1)
	invisible = false
end

local function toolDeactivated()
	if not invisible then
		return
	end
	for _, bodypart in pairs(character:GetChildren()) do
		if bodypart.Name ~= "HumanoidRootPart" then
			if bodypart:IsA("MeshPart") or bodypart:IsA("Part") then
				bodypart.Transparency = 0
			end
		end
	end
end

local function toolEquipped()
	tool:Activate()
end

tool.Equipped:Connect(toolEquipped)
tool.Activated:Connect(toolActivated)
tool.Deactivated:Connect(toolDeactivated)
tool.Unequipped:Connect(toolDeactivated)

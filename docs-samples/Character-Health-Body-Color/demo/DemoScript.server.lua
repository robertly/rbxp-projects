-- Paste into a Script within StarterCharacterScripts
-- Then play the game, and fiddle with your character's health
local char = script.Parent
local human = char.Humanoid

local colorHealthy = Color3.new(0.4, 1, 0.2)
local colorUnhealthy = Color3.new(1, 0.4, 0.2)

local function setColor(color)
	for _, child in pairs(char:GetChildren()) do
		if child:IsA("BasePart") then
			child.Color = color
			while child:FindFirstChildOfClass("Decal") do
				child:FindFirstChildOfClass("Decal"):Destroy()
			end
		elseif child:IsA("Accessory") then
			child.Handle.Color = color
			local mesh = child.Handle:FindFirstChildOfClass("SpecialMesh")
			if mesh then
				mesh.TextureId = ""
			end
		elseif child:IsA("Shirt") or child:IsA("Pants") then
			child:Destroy()
		end
	end
end

local function update()
	local percentage = human.Health / human.MaxHealth

	-- Create a color by tweening based on the percentage of your health
	-- The color goes from colorHealthy (100%) ----- > colorUnhealthy (0%)
	local color = Color3.new(
		colorHealthy.R * percentage + colorUnhealthy.r * (1 - percentage),
		colorHealthy.G * percentage + colorUnhealthy.g * (1 - percentage),
		colorHealthy.B * percentage + colorUnhealthy.b * (1 - percentage)
	)
	setColor(color)
end

update()
human.HealthChanged:Connect(update)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function destroyAccessory(object)
	if object:IsA("Hat") or object:IsA("Accessory") then
		object:Destroy()
	end
end

local function onCharacterAdded(character)
	-- Wait a brief moment before removing accessories to avoid the
	-- "Something unexpectedly set ___ parent to NULL" warning
	RunService.Stepped:Wait()
	-- Check for any existing accessories in the player's character
	for _, child in pairs(character:GetChildren()) do
		destroyAccessory(child)
	end
	-- Hats may be added to the character a moment after
	-- CharacterAdded fires, so we listen for those using ChildAdded
	character.ChildAdded:Connect(destroyAccessory)
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)

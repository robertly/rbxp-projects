local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local teleporter = script.Parent
local showModal = true

local TELEPORT_POSITION = Vector3.new(1200, 200, 60)

-- Teleport character to exclusive area
local function teleportPlayer(player)
	-- Request streaming around target location
	player:RequestStreamAroundAsync(TELEPORT_POSITION)

	-- Teleport character
	local character = player.Character
	if character and character.Parent then
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(TELEPORT_POSITION))
	end
end

-- Detect character parts touching teleporter
teleporter.Touched:Connect(function(otherPart)
	local player = Players:GetPlayerFromCharacter(otherPart.Parent)
	if not player then
		return
	end

	if not player:GetAttribute("CharacterPartsTouching") then
		player:SetAttribute("CharacterPartsTouching", 0)
	end
	player:SetAttribute("CharacterPartsTouching", player:GetAttribute("CharacterPartsTouching") + 1)

	if player.MembershipType == Enum.MembershipType.Premium then
		-- User has Premium; teleport character to exclusive area within experience
		teleportPlayer(player)
	else
		-- Show purchase modal, using debounce to show once every few seconds at most
		if not showModal then
			return
		end
		showModal = false
		task.delay(5, function()
			showModal = true
		end)
		MarketplaceService:PromptPremiumPurchase(player)
	end
end)

-- Detect character parts exiting teleporter
teleporter.TouchEnded:Connect(function(otherPart)
	local player = Players:GetPlayerFromCharacter(otherPart.Parent)
	if player and player:GetAttribute("CharacterPartsTouching") then
		player:SetAttribute("CharacterPartsTouching", player:GetAttribute("CharacterPartsTouching") - 1)
	end
end)

-- Handle membership changed event
Players.PlayerMembershipChanged:Connect(function(player)
	warn("User membership changed; new membership is " .. tostring(player.MembershipType))

	-- Teleport character if membership type is Premium and character is on teleporter
	if player.MembershipType == Enum.MembershipType.Premium and player:GetAttribute("CharacterPartsTouching") > 0 then
		teleportPlayer(player)
	end
end)

local SocialService = game:GetService("SocialService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Function to check whether the player can send an invite
local function canSendGameInvite(sendingPlayer)
	local success, canSend = pcall(function()
		return SocialService:CanSendGameInviteAsync(sendingPlayer)
	end)
	return success and canSend
end

local canInvite = canSendGameInvite(player)
if canInvite then
	local success, errorMessage = pcall(function()
		SocialService:PromptGameInvite(player)
	end)
	if not success then
		warn(errorMessage)
	end
end

local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer

local function checkUserId(userId: number)
	local player = Players:GetPlayerByUserId(userId)
	if player then
		print(("%s is in the game"):format(player.Name))
	else
		print(("UserId %d not found in the game"):format(userId))
	end
end

checkUserId(localPlayer.UserId)
checkUserId(12345)

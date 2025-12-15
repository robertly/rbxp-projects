local Players = game:GetService("Players")

local function replaceClothes(player)
	local character = player.Character
	if character then
		-- look for shirts / pants
		local shirt = character:FindFirstChildOfClass("Shirt")
		local pants = character:FindFirstChildOfClass("Pants")
		-- create shirts / pants if they don't exist
		if not shirt then
			shirt = Instance.new("Shirt")
			shirt.Parent = character
		end
		if not pants then
			pants = Instance.new("Pants")
			pants.Parent = character
		end
		-- reset shirt / pants content ids
		shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=83326831"
		pants.PantsTemplate = "http://www.roblox.com/asset/?id=10045638"
	end
end

for _index, player in ipairs(Players:GetPlayers()) do
	replaceClothes(player)
end

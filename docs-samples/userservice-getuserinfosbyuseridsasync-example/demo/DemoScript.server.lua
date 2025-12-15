local UserService = game:GetService("UserService")

local success, result = pcall(function()
	return UserService:GetUserInfosByUserIdsAsync({ 156, 1, 735878936 })
end)

if success then
	for _, userInfo in ipairs(result) do
		print("Id:", userInfo.Id)
		print("Username:", userInfo.Username)
		print("DisplayName:", userInfo.DisplayName)
	end
else
	-- An error occurred
	warn("Failed to get info: " .. tostring(result))
end

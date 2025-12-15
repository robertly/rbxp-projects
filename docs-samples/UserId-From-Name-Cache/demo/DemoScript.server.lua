local Players = game:GetService("Players")

-- Create a table called 'cache' to store each 'UserId' as they are found.
-- If we lookup a 'UserId' using the same 'Name', the 'UserId' will come
-- from cache (fast) instead of GetUserIdFromNameAsync() (yields).
local cache = {}

function getUserIdFromName(name)
	-- First, check if the cache contains 'name'
	local userIdFromCache = cache[name]
	if userIdFromCache then
		-- if a value was stored in the cache at key 'name', then this 'userIdFromCache'
		-- is the correct UserId and we can return it.
		return userIdFromCache
	end

	-- If here, 'name' was not previously looked up and does not exist in the
	-- cache. Now we need to use GetUserIdFromNameAsync() to look up the userId
	local userId
	local success, _ = pcall(function()
		userId = Players:GetUserIdFromNameAsync(name)
	end)
	if success then
		-- if 'success' is true, GetUserIdFromNameAsync() successfully found the
		-- userId. Store this userId in the cache using 'name' as the key so we
		-- never have to look this userId up in the future. Then return userId.
		cache[name] = userId
		return userId
	end
	-- If here, 'success' was false, meaning GetUserIdFromNameAsync()
	-- was unable to find the 'userId' for the 'name' provided. We can warn the
	-- user this happened and then return nothing, or nil.
	warn("Unable to find UserId for Name:", name)
	return nil
end

-- Example Data:
-- UserId: 118271    Name: "RobloxRulez"
-- UserId: 131963979 Name: "docsRule"

-- The first time a Name is used, GetUserIdFromNameAsync() will be called
local userIdOne = getUserIdFromName("RobloxRulez")
local userIdTwo = getUserIdFromName("docsRule")
-- Because "RobloxRulez" was previously used, get its UserId from the cache
local userIdOneQuick = getUserIdFromName("RobloxRulez")

print(userIdOne, userIdTwo, userIdOneQuick)
-- prints: "118271 131963979 118271"

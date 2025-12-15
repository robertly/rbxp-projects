local Players = game:GetService("Players")

-- Create a table called 'cache' to store each 'Name' as they are found.
-- If we lookup a 'Name' using the same 'UserId', the 'Name' will come
-- from cache (fast) instead of GetNameFromUserIdAsync() (yields).
local cache = {}

function getNameFromUserId(userId)
	-- First, check if the cache contains 'userId'
	local nameFromCache = cache[userId]
	if nameFromCache then
		-- if a value was stored in the cache at key 'userId', then this 'nameFromCache'
		-- is the correct Name and we can return it.
		return nameFromCache
	end

	-- If here, 'userId' was not previously looked up and does not exist in the
	-- cache. Now we need to use GetNameFromUserIdAsync() to look up the name
	local name
	local success, _ = pcall(function()
		name = Players:GetNameFromUserIdAsync(userId)
	end)
	if success then
		-- if 'success' is true, GetNameFromUserIdAsync() successfully found the
		-- name. Store this name in the cache using 'userId' as the key so we
		-- never have to look this name up in the future. Then return name.
		cache[userId] = name
		return name
	end
	-- If here, 'success' was false, meaning GetNameFromUserIdAsync()
	-- was unable to find the 'name' for the 'userId' provided. Warn the user
	-- this happened and then return nothing, or nil.
	warn("Unable to find Name for UserId:", userId)
	return nil
end

-- Example Data:
-- UserId: 118271    Name: "RobloxRulez"
-- UserId: 131963979 Name: "docsRule"

-- The first time a UserId is used, GetNameFromUserIdAsync() will be called
local nameOne = getNameFromUserId(118271)
local nameTwo = getNameFromUserId(131963979)
-- Because 118271 was previously used, get its Name from the cache
local nameOneQuick = getNameFromUserId(118271)

print(nameOne, nameTwo, nameOneQuick)
-- prints: "RobloxRulez docsRule RobloxRulez"

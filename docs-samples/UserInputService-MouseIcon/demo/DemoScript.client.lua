local UserInputService = game:GetService("UserInputService")

-- In order to restore the cursor to what it was set to previously, it will need to be saved to a variable
local savedCursor = nil
local function setTemporaryCursor(cursor: string)
	-- Only update the saved cursor if it's not currently saved
	if not savedCursor then
		savedCursor = UserInputService.MouseIcon
	end
	UserInputService.MouseIcon = cursor
end

local function clearTemporaryCursor()
	-- Only restore the mouse cursor if there's a saved cursor to restore
	if savedCursor then
		UserInputService.MouseIcon = savedCursor
		-- Don't restore the same cursor twice (might overwrite another script)
		savedCursor = nil
	end
end

setTemporaryCursor("http://www.roblox.com/asset?id=163023520")
print(UserInputService.MouseIcon)

clearTemporaryCursor()
print(UserInputService.MouseIcon)

local gameSettings = UserSettings().GameSettings

local function checkFullScreenMode()
	local inFullscreen = gameSettings:InFullScreen()
	if inFullscreen then
		print("Full Screen mode enabled!")
	else
		print("Full Screen mode disabled!")
	end
end

checkFullScreenMode()
gameSettings.FullscreenChanged:Connect(checkFullScreenMode)

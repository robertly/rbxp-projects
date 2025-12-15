local gameSettings = UserSettings().GameSettings

local function onGameSettingChanged(nameOfSetting)
	-- Fetch the value of this setting through a pcall to make sure we can retrieve it.
	-- Sometimes the event fires with properties that LocalScripts can't access.
	local canGetSetting, setting = pcall(function()
		return gameSettings[nameOfSetting]
	end)

	if canGetSetting then
		print("Your " .. nameOfSetting .. " has changed to: " .. tostring(setting))
	end
end

gameSettings.Changed:Connect(onGameSettingChanged)

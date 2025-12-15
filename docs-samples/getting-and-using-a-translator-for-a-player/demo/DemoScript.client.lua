local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")

local textLabel = script.Parent

local success, translator = pcall(function()
	return LocalizationService:GetTranslatorForPlayerAsync(Players.LocalPlayer)
end)

if success then
	local result = translator:Translate(textLabel, "Hello World!")
	print(result)
else
	print("GetTranslatorForPlayerAsync failed: " .. translator)
end

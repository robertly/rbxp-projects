local LocalizationService = game:GetService("LocalizationService")

local textLabel = script.Parent

local success, translator = pcall(function()
	return LocalizationService:GetTranslatorForLocaleAsync("fr")
end)

if success then
	local result = translator:Translate(textLabel, "Hello World!")
	print("Hello in French: " .. result)
else
	print("GetTranslatorForLocaleAsync failed: " .. translator)
end

local LocalizationService = game:GetService("LocalizationService")

local function createLocalizationTable(entries)
	local localTable = Instance.new("LocalizationTable")
	localTable.DevelopmentLanguage = LocalizationService.SystemLocaleId
	localTable:SetEntries(entries)
	return localTable
end

local helloWorldTable = createLocalizationTable({
	[1] = {
		key = "Hello_World", -- The 'expressionKey' to be used with GetString
		values = { -- A dictionary of keys corresponding to IETF language tags, and their translations.
			["ru"] = " !", -- Russian
			["fr"] = "Bonjour le monde!", -- French
			["de"] = "Hallo Welt!", -- German
			["en-US"] = "Hello world!", -- English
			["it"] = "Ciao mondo!", -- Italian
			["pt-BR"] = "Ol Mundo!", -- Portuguese
			["ja"] = "", -- Japanese
			["es"] = "Hola Mundo!", -- Spanish
		},
	},
})

print(helloWorldTable:GetString("en-US", "Hello_World"))

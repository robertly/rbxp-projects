local LocalizationService = game:GetService("LocalizationService")

local localizationTable = LocalizationService:FindFirstChild("LocalizationTable")

local entries = {
	{
		["Key"] = "0001",
		["Source"] = "en-us",
		["Values"] = {
			["0001"] = "Hello Muddah, hello Fadduh.",
			["0002"] = "Here I am at Camp Granada.",
			["0003"] = "Camp is very entertaining.",
			["0004"] = "And they say we'll have some fun if it stops raining.",
		},
	},
}

localizationTable:SetEntries(entries)
local get_results = localizationTable:GetEntries()

for _index, dict in pairs(get_results) do
	for _key, value in pairs(dict["Values"]) do -- Loop through every key, value pair in the dictionary to print our strings
		print(value)
	end
end

local HttpService = game:GetService("HttpService")

local DATA_CHARACTER_LIMIT = 200

local function encodeTableAsLaunchData(data)
	-- convert the table to a string
	local jsonEncodedData = HttpService:JSONEncode(data)

	if #jsonEncodedData <= DATA_CHARACTER_LIMIT then
		-- escape potentially invalid characters, such as spaces
		local urlEncodedData = HttpService:UrlEncode(jsonEncodedData)
		return true, urlEncodedData
	else
		-- report character limit error
		return false, ("Encoded table exceeds %d character limit"):format(DATA_CHARACTER_LIMIT)
	end
end

local sampleData = {
	joinMessage = "Hello!",
	urlCreationDate = os.time(),
	magicNumbers = {
		534,
		1337,
		746733573,
	},
}

local success, encodedData = encodeTableAsLaunchData(sampleData)

if success then
	print(encodedData)
else
	warn("failed to encode launch data: " .. encodedData)
end

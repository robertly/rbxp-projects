local AssetService = game:GetService("AssetService")

local audioSearchParams = Instance.new("AudioSearchParams")
audioSearchParams.SearchKeyword = "happy"

local success, result = pcall(function()
	return AssetService:SearchAudio(audioSearchParams)
end)

if success then
	local currentPage = result:GetCurrentPage()
	for _, audio in currentPage do
		print(audio.Title)
	end
else
	warn("AssetService error: " .. result)
end

--[[ Returned data format
{
	"AudioType": string,
	"Artist": string,
	"Title": string,
	"Tags": {
			"string"
	},
	"Id": number,
	"IsEndorsed": boolean,
	"Description": string,
	"Duration": number,
	"CreateTime": string,
	"UpdateTime": string,
	"Creator": {
			"Id": number,
			"Name": string,
			"Type": number,
			"IsVerifiedCreator": boolean
	}
}
--]]

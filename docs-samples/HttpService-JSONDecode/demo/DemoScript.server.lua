local HttpService = game:GetService("HttpService")

local jsonString = [[
{
	"message": "success",
	"info": {
		"points": 120,
		"isLeader": true,
		"user": {
			"id": 12345,
			"name": "JohnDoe"
		},
		"past_scores": [50, 42, 95],
		"best_friend": null
	}
}
]]

local data = HttpService:JSONDecode(jsonString)

if data.message == "success" then
	-- Since tab["hello"] and tab.hello are equivalent,
	-- you could also use data["info"]["points"] here:
	print("I have " .. data.info.points .. " points")
	if data.info.isLeader then
		print("I am the leader")
	end
	print("I have " .. #data.info.past_scores .. " past scores")

	print("All the information:")
	for key, value in pairs(data.info) do
		print(key, typeof(value), value)
	end
end

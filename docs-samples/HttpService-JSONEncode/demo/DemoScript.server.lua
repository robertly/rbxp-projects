local HttpService = game:GetService("HttpService")

local tab = {
	-- Remember: these lines are equivalent
	--["message"] = "success",
	message = "success",

	info = {
		points = 123,
		isLeader = true,
		user = {
			id = 12345,
			name = "JohnDoe",
		},
		past_scores = { 50, 42, 95 },
		best_friend = nil,
	},
}

local json = HttpService:JSONEncode(tab)
print(json)

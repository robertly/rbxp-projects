local HttpService = game:GetService("HttpService")

-- Where is the International Space Station right now?
local URL_ISS = "http://api.open-notify.org/iss-now.json"

local function printISS()
	local response
	local data
	-- Use pcall in case something goes wrong
	pcall(function()
		response = HttpService:GetAsync(URL_ISS)
		data = HttpService:JSONDecode(response)
	end)
	-- Did our request fail or our JSON fail to parse?
	if not data then
		return false
	end

	-- Fully check our data for validity. This is dependent on what endpoint you're
	-- to which you're sending your requests. For this example, this endpoint is
	-- described here:  http://open-notify.org/Open-Notify-API/ISS-Location-Now/
	if data.message == "success" and data.iss_position then
		if data.iss_position.latitude and data.iss_position.longitude then
			print("The International Space Station is currently at:")
			print(data.iss_position.latitude .. ", " .. data.iss_position.longitude)
			return true
		end
	end
	return false
end

if printISS() then
	print("Success")
else
	print("Something went wrong")
end

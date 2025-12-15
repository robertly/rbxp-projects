local HttpService = game:GetService("HttpService")

local content = "Je suis allé au cinéma." -- French for "I went to the movies"
local result = HttpService:UrlEncode(content)

print(result) --> Je%20suis%20all%C3%A9%20au%20cinema%2E

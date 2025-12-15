local HttpService = game:GetService("HttpService")

local result = HttpService:GenerateGUID(true)

print(result) --> Example output: {04AEBFEA-87FC-480F-A98B-E5E221007A90}

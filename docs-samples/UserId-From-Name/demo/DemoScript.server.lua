local Players = game:GetService("Players")

-- Example Data:
-- UserId: 118271    Name: "RobloxRulez"
-- UserId: 131963979 Name: "docsRule"

local userIdOne = Players:GetUserIdFromNameAsync("RobloxRulez")
local userIdTwo = Players:GetUserIdFromNameAsync("docsRule")
print(userIdOne, userIdTwo)
-- prints: "118271 131963979"

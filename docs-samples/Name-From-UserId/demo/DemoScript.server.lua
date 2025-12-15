local Players = game:GetService("Players")

-- Example Data:
-- UserId: 118271    Name: "RobloxRulez"
-- UserId: 131963979 Name: "docsRule"

local nameOne = Players:GetNameFromUserIdAsync(118271)
local nameTwo = Players:GetNameFromUserIdAsync(131963979)

print(nameOne, nameTwo)
-- prints: "RobloxRulez docsRule"

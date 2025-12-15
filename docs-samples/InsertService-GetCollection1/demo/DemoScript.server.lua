local InsertService = game:GetService("InsertService")

local set = InsertService:GetBaseSets()[1]
local list = InsertService:GetCollection(set["CategoryId"])

print(list)

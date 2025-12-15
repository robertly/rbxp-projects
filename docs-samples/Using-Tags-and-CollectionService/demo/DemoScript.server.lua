local CollectionService = game:GetService("CollectionService")

local object = script.Parent.Part

-- Add a tag
CollectionService:AddTag(object, "Deadly")

-- Query for a tag
if CollectionService:HasTag(object, "Deadly") then
	print(object:GetFullName() .. " is deadly")
end

-- List tags on an object
local tags = CollectionService:GetTags(object)
print("The object " .. object:GetFullName() .. " has tags: " .. table.concat(tags, ", "))

-- Remove a tag
CollectionService:RemoveTag(object, "Deadly")

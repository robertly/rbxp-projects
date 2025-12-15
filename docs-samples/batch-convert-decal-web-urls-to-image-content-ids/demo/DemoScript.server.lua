local IMAGES = {
	-- Insert Decal web URLs in an array here (as strings)
}

-- open the dictionary
local outputString = "textures = {"

-- utility function to add a new entry to the dictionary (as a string)
local function addEntryToDictionary(original, new)
	outputString = outputString
		.. "\n" -- new line
		.. "    " -- indent
		.. '["'
		.. original
		.. '"]' -- key
		.. ' = "'
		.. new
		.. '",' -- value
end

print("Starting conversion")

for _, webURL in pairs(IMAGES) do
	-- get the content URL
	local contentID = string.match(webURL, "%d+")
	local contentURL = "rbxassetid://" .. contentID

	local success, result = pcall(function()
		local objects = game:GetObjects(contentURL)
		return objects[1].Texture
	end)

	if success then
		addEntryToDictionary(webURL, result)
	else
		addEntryToDictionary(webURL, "Error downloading decal")
	end

	task.wait()
end

print("Conversion complete")

-- close the dictionary
outputString = outputString .. "\n}"

-- print the dictionary
print(outputString)

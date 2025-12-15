local Selection = game:GetService("Selection")

local WEB_URL = "plugin URL here"

local function downloadPlugin(webURL)
	-- get the content URL
	local contentID = string.match(webURL, "%d+")
	local contentURL = "rbxassetid://" .. contentID

	-- download the objects
	local objects = game:GetObjects(contentURL)

	-- decide where to parent them
	local selection = Selection:Get()
	local parent = #selection == 1 and selection[1] or workspace

	-- parent the objects
	for _, object in pairs(objects) do
		object.Parent = parent
	end
end

downloadPlugin(WEB_URL)

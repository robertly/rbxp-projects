local textLabel = script.Parent

local moods = {
	["happy"] = "😃",
	["sad"] = "😢",
	["neutral"] = "😐",
	["tired"] = "😫",
}

while true do
	for mood, face in pairs(moods) do
		textLabel.Text = "I am feeling " .. mood .. "! " .. face
		task.wait(1)
	end
end

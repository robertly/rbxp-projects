local textLabel = script.Parent

-- This text wrapping demo is best shown on a 200x50 px rectangle
textLabel.Size = UDim2.new(0, 200, 0, 50)

-- Some content to spell out
local content = "Here's a long string of words that will "
	.. "eventually exceed the UI element's width "
	.. "and form line breaks. Useful for paragraphs "
	.. "that are really long."

-- A function that will spell text out two characters at a time
local function spellTheText()
	-- Iterate from 1 to the length of our content
	for i = 1, content:len() do
		-- Get a substring of our content: 1 to i
		textLabel.Text = content:sub(1, i)
		-- Color the text if it doesn't fit in our box
		if textLabel.TextFits then
			textLabel.TextColor3 = Color3.new(0, 0, 0) -- Black
		else
			textLabel.TextColor3 = Color3.new(1, 0, 0) -- Red
		end
		-- Wait a brief moment on even lengths
		if i % 2 == 0 then
			task.wait()
		end
	end
end

while true do
	-- Spell the text with scale/wrap off
	textLabel.TextWrapped = false
	textLabel.TextScaled = false
	spellTheText()
	task.wait(1)
	-- Spell the text with wrap on
	textLabel.TextWrapped = true
	textLabel.TextScaled = false
	spellTheText()
	task.wait(1)
	-- Spell the text with text scaling on
	-- Note: Text turns red (TextFits = false) once text has to be
	-- scaled down in order to fit within the UI element.
	textLabel.TextScaled = true
	-- Note: TextWrapped is enabled implicitly when TextScaled = true
	--textLabel.TextWrapped = true
	spellTheText()
	task.wait(1)
end

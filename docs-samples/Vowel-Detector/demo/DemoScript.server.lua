local textBox = script.Parent

local function hasVowels(str)
	return str:lower():find("[aeiou]")
end

local function onTextChanged()
	local text = textBox.Text
	-- Check for vowels
	if hasVowels(text) then
		textBox.TextColor3 = Color3.new(0, 0, 0) -- Black
	else
		textBox.TextColor3 = Color3.new(1, 0, 0) -- Red
	end
end

textBox:GetPropertyChangedSignal("Text"):Connect(onTextChanged)

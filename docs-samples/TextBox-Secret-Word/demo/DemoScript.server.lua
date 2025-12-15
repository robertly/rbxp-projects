-- Place this code in a LocalScript inside a TextBox
local textBox = script.Parent

local secretWord = "roblox"
local colorNormal = Color3.new(1, 1, 1) -- white
local colorWrong = Color3.new(1, 0, 0) -- red
local colorCorrect = Color3.new(0, 1, 0) -- green

-- Initialize the state of the textBox
textBox.ClearTextOnFocus = true
textBox.Text = ""
textBox.Font = Enum.Font.Code
textBox.PlaceholderText = "What is the secret word?"
textBox.BackgroundColor3 = colorNormal

local function onFocused()
	textBox.BackgroundColor3 = colorNormal
end

local function onFocusLost(enterPressed, _inputObject)
	if enterPressed then
		local guess = textBox.Text
		if guess == secretWord then
			textBox.Text = "ACCESS GRANTED"
			textBox.BackgroundColor3 = colorCorrect
		else
			textBox.Text = "ACCESS DENIED"
			textBox.BackgroundColor3 = colorWrong
		end
	else
		-- The player stopped editing without pressing Enter
		textBox.Text = ""
		textBox.BackgroundColor3 = colorNormal
	end
end

textBox.FocusLost:Connect(onFocusLost)
textBox.Focused:Connect(onFocused)

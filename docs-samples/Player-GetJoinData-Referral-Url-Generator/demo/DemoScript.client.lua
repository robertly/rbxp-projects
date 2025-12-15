local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer

local DIRECT_JOIN_URL = "https://www.roblox.com/games/start?placeId=%d&launchData=%s"

local textBox = script.Parent

local function generateReferralURL(player)
	return DIRECT_JOIN_URL:format(game.PlaceId, player.UserId)
end

local function highlightAll()
	if -- avoid recursive property updates
		textBox:IsFocused() and not (textBox.SelectionStart == 1 and textBox.CursorPosition == #textBox.Text + 1)
	then
		textBox.SelectionStart = 1
		textBox.CursorPosition = #textBox.Text + 1
	end
end

textBox.Focused:Connect(highlightAll)
textBox:GetPropertyChangedSignal("SelectionStart"):Connect(highlightAll)
textBox:GetPropertyChangedSignal("CursorPosition"):Connect(highlightAll)

textBox.TextEditable = false
textBox.ClearTextOnFocus = false

textBox.Text = generateReferralURL(localPlayer)

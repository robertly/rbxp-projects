local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
local BubbleChatConfiguration = TextChatService:FindFirstChildOfClass("BubbleChatConfiguration")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Set up TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.fromScale(1, 1)
textLabel.Text = ". . ."
textLabel.BackgroundColor3 = BubbleChatConfiguration.BackgroundColor3
textLabel.BorderColor3 = BubbleChatConfiguration.BackgroundColor3
textLabel.BackgroundTransparency = BubbleChatConfiguration.BackgroundTransparency
textLabel.TextColor3 = BubbleChatConfiguration.TextColor3
textLabel.FontFace = BubbleChatConfiguration.FontFace
textLabel.TextSize = BubbleChatConfiguration.TextSize
-- Parent a UICorner to the TextLabel to have rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = textLabel

-- Set up Billboard
local typingIndicatorBillboard = Instance.new("BillboardGui")
typingIndicatorBillboard.Enabled = false
typingIndicatorBillboard.Size = UDim2.fromScale(1, 1)
typingIndicatorBillboard.StudsOffsetWorldSpace = Vector3.new(-0, 4, 0)
typingIndicatorBillboard.Adornee = Character
textLabel.Parent = typingIndicatorBillboard
typingIndicatorBillboard.Parent = LocalPlayer:FindFirstChildOfClass("PlayerGui")

ChatInputBarConfiguration:GetPropertyChangedSignal("IsFocused"):Connect(function()
	-- Enable the typing indicator when the input bar is focused and disable otherwise
	typingIndicatorBillboard.Enabled = ChatInputBarConfiguration.IsFocused
end)

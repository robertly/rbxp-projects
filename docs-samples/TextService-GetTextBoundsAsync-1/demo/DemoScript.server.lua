local TextService = game:GetService("TextService")

local params = Instance.new("GetTextBoundsParams")
params.Text = "hello world!"
params.Font = Font.new("rbxasset://fonts/families/GrenzeGotisch.json", Enum.FontWeight.Thin)
params.Size = 20
params.Width = 200
local size = TextService:GetTextBoundsAsync(params)

print("The size of the text is:", size)

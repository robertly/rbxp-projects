local TextService = game:GetService("TextService")

local function getTextBounds()
	local message = "Hello World"
	local size = Vector2.new(1, 1)
	local bounds = TextService:GetTextSize(message, 12, "SourceSans", size)
	return bounds + Vector2.new(1, 1)
end

print(getTextBounds())

-- Paste this in a LocalScript within a TextLabel/TextButton/TextBox
local textLabel = script.Parent

local function setAlignment(xAlign, yAlign)
	textLabel.TextXAlignment = xAlign
	textLabel.TextYAlignment = yAlign
	textLabel.Text = xAlign.Name .. " + " .. yAlign.Name
end

while true do
	-- Iterate over both TextXAlignment and TextYAlignment enum items
	for _, yAlign in pairs(Enum.TextYAlignment:GetEnumItems()) do
		for _, xAlign in pairs(Enum.TextXAlignment:GetEnumItems()) do
			setAlignment(xAlign, yAlign)
			task.wait(1)
		end
	end
end

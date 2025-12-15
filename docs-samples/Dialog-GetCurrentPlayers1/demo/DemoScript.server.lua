local dialog = script.Parent

local function onChoiceSelected(_player, _choice)
	local currentPlayers = dialog:GetCurrentPlayers()
	print("The current players in the dialog:")
	for _, player in ipairs(currentPlayers) do
		print(player)
	end
end

dialog.DialogChoiceSelected:Connect(onChoiceSelected)

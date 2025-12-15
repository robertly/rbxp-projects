local function onClose()
	print("The place is closing")
end

game.Close:Connect(onClose)

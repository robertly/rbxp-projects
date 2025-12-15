game.GraphicsQualityChangeRequest:Connect(function(betterQuality)
	if betterQuality then
		print("The user has requested an increase in graphics quality!")
	else
		print("The user has requested a decrease in graphics quality!")
	end
end)

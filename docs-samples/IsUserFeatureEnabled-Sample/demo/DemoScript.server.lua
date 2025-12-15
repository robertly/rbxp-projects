if UserSettings():IsUserFeatureEnabled("UserNoCameraClickToMove") then
	print("'ClickToMove' should no longer be loaded from the CameraScript!")
else
	print("'ClickToMove' is still loaded from the CameraScript!")
end

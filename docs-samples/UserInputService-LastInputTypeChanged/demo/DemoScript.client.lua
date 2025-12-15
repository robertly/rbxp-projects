local UserInputService = game:GetService("UserInputService")

local mouseInput = {
	Enum.UserInputType.MouseButton1,
	Enum.UserInputType.MouseButton2,
	Enum.UserInputType.MouseButton3,
	Enum.UserInputType.MouseMovement,
	Enum.UserInputType.MouseWheel,
}

local keyboard = Enum.UserInputType.Keyboard

local function toggleMouse(lastInputType)
	if lastInputType == keyboard then
		UserInputService.MouseIconEnabled = false
		return
	end

	for _, mouse in pairs(mouseInput) do
		if lastInputType == mouse then
			UserInputService.MouseIconEnabled = true
			return
		end
	end
end

UserInputService.LastInputTypeChanged:Connect(toggleMouse)

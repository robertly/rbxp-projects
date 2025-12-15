local Lighting = game:GetService("Lighting")

local function onLightingChanged(skyboxChanged)
	if skyboxChanged then
		print("Skybox has changed")
	else
		print("The skybox did not change.")
	end
end

Lighting.LightingChanged:Connect(onLightingChanged)

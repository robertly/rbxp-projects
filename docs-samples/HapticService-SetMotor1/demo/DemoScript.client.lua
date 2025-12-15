local UserInputService = game:GetService("UserInputService")
local HapticService = game:GetService("HapticService")

local cachedInputs = {} -- Note that we use a cache so we don't attach a Changed event more than once.

local keyToVibration = {
	[Enum.KeyCode.ButtonL2] = Enum.VibrationMotor.Small,
	[Enum.KeyCode.ButtonR2] = Enum.VibrationMotor.Large,
}

local function onInputBegan(input)
	if not cachedInputs[input] then
		local inputType = input.UserInputType
		if inputType.Name:find("Gamepad") then
			local vibrationMotor = keyToVibration[input.KeyCode]
			if vibrationMotor then
				-- Watch this InputObject manually so we can accurately update the vibrationMotor.
				local function onChanged(property)
					if property == "Position" then
						HapticService:SetMotor(inputType, vibrationMotor, input.Position.Z)
					end
				end
				cachedInputs[input] = input.Changed:Connect(onChanged)
			end
		end
	end
end

UserInputService.InputBegan:Connect(onInputBegan)

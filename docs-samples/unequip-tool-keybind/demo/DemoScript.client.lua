local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")

local player = Players.LocalPlayer

ContextActionService:BindAction("unequipTools", function(_, userInputState)
	if userInputState == Enum.UserInputState.Begin then
		if player.Character then
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid:UnequipTools()
			end
		end
	end
end, false, Enum.KeyCode.U)

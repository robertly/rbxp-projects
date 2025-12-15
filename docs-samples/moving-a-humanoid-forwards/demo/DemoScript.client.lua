local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
	if player.Character then
		local humanoid = player.Character:FindFirstChild("Humanoid")
		if humanoid then
			humanoid:Move(Vector3.new(0, 0, -1), true)
		end
	end
end)

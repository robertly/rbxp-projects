local ChangeHistoryService = game:GetService("ChangeHistoryService")
local Selection = game:GetService("Selection")

local toolbar = plugin:CreateToolbar("Example Plugin")
local button = toolbar:CreateButton("Neon it up", "", "")

button.Click:Connect(function()
	local parts = {}
	for _, part in pairs(Selection:Get()) do
		if part:IsA("BasePart") then
			parts[#parts + 1] = part
		end
	end

	if #parts > 0 then
		-- Calling SetWaypoint before the work will not cause any issues, however
		-- it is redundant, only the call AFTER the work is needed.
		--ChangeHistoryService:SetWaypoint("Setting selection to neon")

		for _, part in pairs(parts) do
			part.Material = Enum.Material.Neon
		end

		-- Call SetWaypoint AFTER completing the work
		ChangeHistoryService:SetWaypoint("Set selection to neon")
	end
end)

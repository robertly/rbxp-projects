local Players = game:GetService("Players")

local function giveTool(player, tool)
	local backpack = player:FindFirstChildOfClass("Backpack")
	if backpack then
		tool.Parent = backpack
	end
end

local function onPlayerAdded(player)
	local tool = Instance.new("Tool")
	giveTool(player, tool)
end

Players.PlayerAdded:Connect(onPlayerAdded)

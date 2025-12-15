local ReplicatedStorage = game:GetService("ReplicatedStorage")

local promptPurchaseEvent = ReplicatedStorage:WaitForChild("PromptPurchaseEvent")

local part = Instance.new("Part")
part.Parent = workspace

local clickDetector = Instance.new("ClickDetector")
clickDetector.Parent = part

clickDetector.MouseClick:Connect(function()
	promptPurchaseEvent:FireServer(16630147)
end)

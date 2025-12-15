local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local promptPurchaseEvent = Instance.new("RemoteEvent")
promptPurchaseEvent.Name = "PromptPurchaseEvent"
promptPurchaseEvent.Parent = ReplicatedStorage

-- Listen for the RemoteEvent to fire from a Client and then trigger the purchase prompt
promptPurchaseEvent.OnServerEvent:Connect(function(player, id)
	MarketplaceService:PromptPurchase(player, id)
end)

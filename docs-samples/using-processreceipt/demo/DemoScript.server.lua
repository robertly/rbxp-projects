local MarketplaceService = game:GetService("MarketplaceService")
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

-- Data store for tracking purchases that were successfully processed
local purchaseHistoryStore = DataStoreService:GetDataStore("PurchaseHistory")

-- Table setup containing product IDs and functions for handling purchases
local productFunctions = {}
-- ProductId 123123 for a full heal
productFunctions[123123] = function(_receipt, player)
	-- Logic/code for player buying a full heal (may vary)
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		-- Heal the player to full health
		player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
		-- Indicate a successful purchase
		return true
	end

	return false
end
-- ProductId 456456 for 100 gold
productFunctions[456456] = function(_receipt, player)
	-- Logic/code for player buying 100 gold (may vary)
	local stats = player:FindFirstChild("leaderstats")
	local gold = stats and stats:FindFirstChild("Gold")
	if gold then
		gold.Value = gold.Value + 100
		-- Indicate a successful purchase
		return true
	end

	return false
end

-- The core 'ProcessReceipt' callback function
local function processReceipt(receiptInfo)
	-- Determine if the product was already granted by checking the data store
	local playerProductKey = receiptInfo.PlayerId .. "_" .. receiptInfo.PurchaseId

	local isPurchasedSuccess, isPurchasedResult = pcall(function()
		return purchaseHistoryStore:GetAsync(playerProductKey)
	end)
	-- If purchase was recorded, the product was already granted
	if isPurchasedSuccess and isPurchasedResult then
		return Enum.ProductPurchaseDecision.PurchaseGranted
	elseif not isPurchasedSuccess then
		warn(`Data store error: {isPurchasedResult}`)
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	-- Determine if the product was already granted by checking the data store

	local purchaseSuccess, isPurchaseRecorded = pcall(function()
		return purchaseHistoryStore:UpdateAsync(playerProductKey, function(alreadyPurchased)
			if alreadyPurchased then
				return true
			end

			-- Find the player who made the purchase in the server
			local player = Players:GetPlayerByUserId(receiptInfo.PlayerId)
			if not player then
				-- The player probably left the game
				-- If they come back, the callback will be called again
				return nil
			end

			local handler = productFunctions[receiptInfo.ProductId]

			local success, result = pcall(handler, receiptInfo, player)
			-- If granting the product failed, do NOT record the purchase in datastores.
			if not success or not result then
				warn(
					`Failed to process a product purchase for ProductId: {receiptInfo.ProductId} Player: {player} Error: {result}`
				)
				return nil
			end

			-- Record the transacation in purchaseHistoryStore.
			return true
		end)
	end)

	if not purchaseSuccess then
		warn("Failed to process receipt due to data store error.")
		return Enum.ProductPurchaseDecision.NotProcessedYet
	elseif isPurchaseRecorded == nil then
		-- Didn't update the value in data store.
		return Enum.ProductPurchaseDecision.NotProcessedYet
	else
		-- IMPORTANT: Tell Roblox that the game successfully handled the purchase
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
end

-- Set the callback; this can only be done once by one script on the server!
MarketplaceService.ProcessReceipt = processReceipt

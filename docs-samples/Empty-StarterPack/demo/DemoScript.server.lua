local StarterPack = game:GetService("StarterPack")

local function emptyStarterPack()
	for _, child in pairs(StarterPack:GetChildren()) do
		if child:IsA("Tool") then
			child:Destroy()
		end
	end
end

emptyStarterPack()

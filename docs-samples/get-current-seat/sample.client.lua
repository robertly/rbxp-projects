--!strict
local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer :: Player

local seatedConnection

local function onSeated(isSeated: boolean, seat: BasePart)
	if isSeated then
		print(`I'm now sitting on: {seat.Name}`)
	else
		print("I'm not sitting on anything")
	end
end

local function onCharacterAdded(character: Model)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid

	if seatedConnection then
		seatedConnection:Disconnect()
	end

	seatedConnection = humanoid.Seated:Connect(onSeated)
end

if localPlayer.Character then
	onCharacterAdded(localPlayer.Character)
end
localPlayer.CharacterAdded:Connect(onCharacterAdded)

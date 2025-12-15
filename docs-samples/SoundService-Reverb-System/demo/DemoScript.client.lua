local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local SoundService = game:GetService("SoundService")

local localPlayer = Players.LocalPlayer

local reverbTags = {
	["reverb_Cave"] = Enum.ReverbType.Cave,
}

-- collect parts and group them by tag
local parts = {}
for reverbTag, reverbType in pairs(reverbTags) do
	for _, part in pairs(CollectionService:GetTagged(reverbTag)) do
		parts[part] = reverbType
	end
end

-- function to check if a position is within a part's extents
local function positionInPart(part, position)
	local extents = part.Size / 2
	local offset = part.CFrame:PointToObjectSpace(position)
	return offset.x < extents.x and offset.y < extents.y and offset.z < extents.z
end

local reverbType = SoundService.AmbientReverb

while true do
	task.wait()
	if not localPlayer then
		return
	end

	local character = localPlayer.Character

	-- default to no reverb
	local newReverbType = Enum.ReverbType.NoReverb

	if character and character.PrimaryPart then
		local position = character.PrimaryPart.Position

		-- go through all the indexed parts
		for part, type in pairs(parts) do
			-- see if the character is within them
			if positionInPart(part, position) then
				-- if so, pick that reverb type
				newReverbType = type
				break
			end
		end
	end

	-- set the reverb type if it has changed
	if newReverbType ~= reverbType then
		SoundService.AmbientReverb = newReverbType
		reverbType = newReverbType
	end
end

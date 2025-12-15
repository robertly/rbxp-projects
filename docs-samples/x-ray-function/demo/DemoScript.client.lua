local Workspace = game:GetService("Workspace")

local camera = Workspace.CurrentCamera

local function XRay(castPoints, ignoreList)
	ignoreList = ignoreList or {}
	local parts = camera:GetPartsObscuringTarget(castPoints, ignoreList)

	for _, part in parts do
		part.LocalTransparencyModifier = 0.75
		for _, child in pairs(part:GetChildren()) do
			if child:IsA("Decal") or child:IsA("Texture") then
				child.LocalTransparencyModifier = 0.75
			end
		end
	end
end

XRay({ Vector3.new() })

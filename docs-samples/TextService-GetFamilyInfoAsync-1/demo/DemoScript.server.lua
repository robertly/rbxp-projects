local TextService = game:GetService("TextService")

local familyToCheck = "rbxasset://fonts/families/Arial.json"

-- This is a yield function which may take up to a few seconds to download the font.
local info = TextService:GetFamilyInfoAsync(familyToCheck)

print("Name of the font:", info.Name)
print("Faces:")
for _, face in info.Faces do
	print("--------")
	print("Name:", face.Name)
	print("Weight:", face.Weight.Name)
	print("Style:", face.Style.Name)
end
